#!/usr/bin/env bash

set -euo pipefail -x

TMP=`mktemp -d`

# get latest release
npm install --prefix $TMP @openzeppelin/contracts-upgradeable@latest

# preparing environment
mv $TMP/node_modules/@openzeppelin/contracts-upgradeable $TMP/contracts

# compile contracts
ROOT=.    npx hardhat compile
ROOT=$TMP npx hardhat compile

# compare the layouts
node scripts/upgradeable/layout-rebuild-and-compare.js \
    --ref $TMP/artifacts/build-info/*.json \
    --head $PWD/artifacts/build-info/*.json

# TODO: delete even if comparaison fails
rm $TMP
