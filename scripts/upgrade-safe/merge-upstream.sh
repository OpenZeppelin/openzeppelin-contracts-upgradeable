#!/usr/bin/env bash

set -euo pipefail -x

bash scripts/upgrade-safe/git-user-config.sh

git fetch 'https://github.com/OpenZeppelin/openzeppelin-contracts.git'
git merge FETCH_HEAD -m 'Merge upstream openzeppelin-contracts into upstream-patched'
git push
