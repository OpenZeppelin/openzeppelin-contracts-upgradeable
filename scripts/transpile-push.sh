#!/usr/bin/env bash

set -euo pipefail -x

bash scripts/transpile.sh

git config user.name 'github-actions'
git config user.email '41898282+github-actions[bot]@users.noreply.github.com'

COMMIT="$(git rev-parse --short HEAD)"

git checkout --orphan master
git reset --soft origin/master
git commit -m "Transpile $COMMIT"
git push origin master
