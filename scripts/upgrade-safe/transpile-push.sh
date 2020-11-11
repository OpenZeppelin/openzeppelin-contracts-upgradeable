#!/usr/bin/env bash

set -euo pipefail -x

bash scripts/upgrade-safe/transpile.sh
bash scripts/upgrade-safe/git-user-config.sh

COMMIT="$(git rev-parse --short HEAD)"

git add contracts
git checkout --orphan master
git reset --soft origin/master
if ! git diff --cached --quiet; then
  git commit -m "Transpile $COMMIT"
fi
git push origin master
