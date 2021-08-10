#!/usr/bin/env bash

set -euo pipefail

: "${REF:="$(git rev-parse --symbolic-full-name HEAD)"}"

if [[ "$REF" != refs/heads/* ]]; then
  echo "$REF is not a branch" >&2
  exit 1
elif [[ "$REF" == refs/heads/patches ]]; then
  REF=refs/heads/master
fi

set -x

input="${REF#refs/heads/}"
upstream="${input#patched/}"
branch="patched/$upstream"

git switch "$branch" 2>/dev/null || git switch -c "$branch" -t "origin/$branch" origin/patches
git fetch 'https://github.com/OpenZeppelin/openzeppelin-contracts.git' "$upstream"
git merge origin/patches FETCH_HEAD -m "Merge upstream $upstream into $branch"
