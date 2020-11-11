#!/usr/bin/env bash

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "usage: bash $0 <branch> [base]" >&2
  exit 1
fi

set -x

branch="$1"
base="${2:-}"

bash scripts/upgrade-safe/transpile.sh

commit="$(git rev-parse --short HEAD)"

git add contracts
git checkout --orphan "$branch"

if [ -n "$base" ]; then
  git reset --soft "$base"
fi

if ! git diff --cached --quiet; then
  git commit -m "Transpile $commit"
fi
