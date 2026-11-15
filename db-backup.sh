#!/usr/bin/env bash

OUT_DIR="./backup"
VERBOSE=false
CLEAN_BACKUP=false
_idx=
_fidx=
args=()
no_data=("staging" "users")
SECTIONS=("pre-data" "data" "post-data")
declare -A SECTIONS_MAP=()

while getopts ":hcd:v" opt; do
    case $opt in
        h)
            sed 's/^[[:space:]][[:space:]]*/    /;' <<-EOF
				$0 [-v] [-c] [-d <dir>]
	    			-v       Enable verbose logging
	    			-c       Enable a "clean" database dump (no data from staging or users)
	    			-d <dir> Specify the directory to dump the data into.  Default: ./backup
	    			-h       Usage help
				EOF
            exit 0
            ;;
        v)
            VERBOSE=true
            ;;

        c)
            CLEAN_BACKUP=true
            ;;

        d)
            OUT_DIR="${OPTARG}"
            ;;

        \?)
            echo "Error: Invalid option -$OPTARG" >&2
            exit 1
            ;;

        :)
            echo "Error: Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

next_idx() {

    if [[ -z "${_idx}" || -n $1 ]]; then
        _idx=${1:-0}
    else
        _idx=$((_idx + 1))
    fi
    _fidx=$(printf "%02d" ${_idx})
}

schemas2args() {
    [[ "${#args[*]}" -gt 0 ]] && return

    local var="${1}"
    local switch="${2}"

    mapfile -t words <<< "${var}"

    for w in "${words[@]}"; do
        args+=("${switch}" "$w")
    done
    unset words
}

in_array() {
    local target="$1"
    shift
    local list=("${@}")
    
    printf '%s\n' "${list[@]}" | grep -Fxq "$target" && return 0
    return 1
}

log() {
    $VERBOSE || return

    printf "$@"
}

error() {
    printf "$@" >&2
}

abort() {
    error "\n\n Ctrl+C detected. Aborting script...\n"
    exit 130
}

trap abort INT

next_idx # Initialize the index counter

# Fetch all user-defined schemas, but don't need public
SCHEMAS=$(
    psql -U "$DB_USER" \
         -h "${DB_HOST}" \
         -d "$DB_NAME" \
         -Atc "SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT IN ('information_schema', 'pg_catalog', 'pg_toast') AND schema_name NOT LIKE 'pg_temp_%';"\
    | sort \
    | sed '/public/d;'
)

schemas2args "${SCHEMAS}" "-N"

mkdir "${OUT_DIR}" &>/dev/null && log "Created backup directory '$OUT_DIR'\n"

log "Dumping to ${OUT_DIR}\n"

# Dump the global info
log "Global\n"
pg_dumpall -h "${DB_HOST}" -U "${DB_USER}" --roles-only --no-role-passwords -f "${OUT_DIR}/${_fidx}_roles.sql" ; next_idx

# Dump the non-schema info for the database
log "DB '${DB_NAME}'\n"
pg_dump    -h "${DB_HOST}" -U "${DB_USER}" -d "${DB_NAME}" -C -c -s -O -x --if-exists "${args[@]}" -f "${OUT_DIR}/${_fidx}_database_globals.sql" ; next_idx

# Create the *data subdirectories, and store their names
for section in "${SECTIONS[@]}"; do
    sub_dir="${_fidx}_${section}"
    mkdir "${OUT_DIR}/${sub_dir}" ; next_idx
    SECTIONS_MAP+=(["${section}"]="${sub_dir}")
done

# Dump the pre-data, data, post-data for each schema
next_idx 0
for SCHEMA in $SCHEMAS; do
    log "SCHEMA %15s > " "'${SCHEMA}'"

    for section in "${SECTIONS[@]}"; do
        { $CLEAN_BACKUP && in_array "${SCHEMA}" "${no_data[@]}" ; } && sargs=('-s') || sargs=()
    
        sub_dir="${OUT_DIR}/${SECTIONS_MAP["${section}"]}"
    
        pg_dump -h "${DB_HOST}" -U "$DB_USER" -d "$DB_NAME" -n "$SCHEMA" --section="${section}" "${sargs[@]}" -O -x -f "${sub_dir}/${_fidx}_${SCHEMA}.sql"

    done

    log "%6d lines %7d bytes\n" $(wc -cl --total only "${OUT_DIR}/"*data"/${_fidx}_${SCHEMA}.sql")

    next_idx
done

unset _idx _fidx
unset args sargs
unset OUT_DIR
unset SCHEMAS
unset sub_dir
unset section
unset SECTIONS
unset -f abort
unset -f error
unset -f in_array
unset -f log
unset -f next_idx
unset -f schemas2args
