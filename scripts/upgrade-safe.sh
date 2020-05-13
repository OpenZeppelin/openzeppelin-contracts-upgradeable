#!/usr/bin/env bash

set -euo pipefail

git checkout contracts test
rm -rf build contracts/Initializable.sol

npm run compile

node ~/oz/transpiler/dist/cli.js

mv contracts/__upgradeable__ .
rm -rf contracts
mv __upgradeable__ contracts

git checkout $(git ls-files -d)

# git add contracts

rs "contract\.fromArtifact\('([^I].*?)'\)" "contract.fromArtifact('\${1}UpgradeSafe')" test

cat patches/* | patch -p1

rs ' +$' '' contracts

npm run compile
