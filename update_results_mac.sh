#!/bin/sh
set -eu
if [ "$#" -ne 1 ]; then echo "Usage: $0 /path/to/downloaded-results.csv"; exit 2; fi
case "$1" in /*) src="$1";; *) src="$(pwd)/$1";; esac
test -f "$src"
python3 - "$src" <<'PY'
import csv,sys
with open(sys.argv[1],newline='',encoding='utf-8-sig') as f: rows=list(csv.DictReader(f))
required={'Election Name','County Name','Office Name','District Name','Party Name','Candidate Name','Votes'}
if not rows or not required.issubset(rows[0]): raise SystemExit('Not the expected PA results CSV')
PY
cp "$src" data/UnOfficial_1132026091717PM.CSV
echo "Updated data. Commit and push data/UnOfficial_1132026091717PM.CSV to GitHub."
