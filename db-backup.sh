#!/usr/bin/env bash

OUT_DIR="./backup"
VERBOSE=false
CLEAN_BACKUP=false

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

_idx=
_fidx=
args=()
no_data=("staging" "users")

next_idx() {

    if [[ -z "${_idx}" ]]; then
        _idx=0
    else
        _idx=$((_idx + 1))
    fi
    _fidx=$(printf "%03d" ${_idx})
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

mkdir "$OUT_DIR" &>/dev/null && log "Created backup directory '$OUT_DIR'\n"

log "Dumping to ${OUT_DIR}\n"

# Dump the global info
log "Global\n"
pg_dumpall -h "${DB_HOST}" -U "${DB_USER}" --roles-only --no-role-passwords -f "${OUT_DIR}/${_fidx}_roles.sql" ; next_idx

# Dump the non-schema info for the database
log "DB '${DB_NAME}'\n"
pg_dump    -h "${DB_HOST}" -U "${DB_USER}" -d "${DB_NAME}" -C -c -s -O -x --if-exists "${args[@]}" -f "${OUT_DIR}/${_fidx}_database_globals.sql" ; next_idx

# Dump the pre-data, data, post-data for each schema
for SCHEMA in $SCHEMAS; do

    { $CLEAN_BACKUP && in_array "${SCHEMA}" "${no_data[@]}" ; } && sargs=('-s') || sargs=()

    log "SCHEMA %15s > " "'${SCHEMA}'"

    pg_dump -h "${DB_HOST}" -U "$DB_USER" -d "$DB_NAME" -n "$SCHEMA" --section=pre-data "${sargs[@]}"  -O -x -f "$OUT_DIR/${_fidx}_${SCHEMA}-pre_data.sql" ; next_idx
    pg_dump -h "${DB_HOST}" -U "$DB_USER" -d "$DB_NAME" -n "$SCHEMA" --section=data "${sargs[@]}"      -O -x -f "$OUT_DIR/${_fidx}_${SCHEMA}-data.sql" ; next_idx
    pg_dump -h "${DB_HOST}" -U "$DB_USER" -d "$DB_NAME" -n "$SCHEMA" --section=post-data "${sargs[@]}" -O -x -f "$OUT_DIR/${_fidx}_${SCHEMA}-post_data.sql" ; next_idx

    log "%6d lines %7d bytes\n" $(wc -cl --total only "${OUT_DIR}/"*"_${SCHEMA}-"*".sql")
done

unset _idx _fidx
unset args sargs
unset OUT_DIR
unset SCHEMAS
unset -f abort
unset -f error
unset -f in_array
unset -f log
unset -f next_idx
unset -f schemas2args
