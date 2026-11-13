#!/usr/bin/env bash

python -mvenv venv
source venv/bin/activate

pip install --upgrade pip

pip install -r requirements.txt

printf "\n\n\nRun 'source ./activate'\n"
