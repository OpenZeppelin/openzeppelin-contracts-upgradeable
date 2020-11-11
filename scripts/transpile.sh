#!/usr/bin/env bash

set -euo pipefail -x

npm run compile

# -D: delete original and excluded files
# -i: use included Initializable
# -x: exclude all proxy contracts
npx @openzeppelin/upgrade-safe-transpiler -D -i contracts/proxy/Initializable.sol -x 'contracts/proxy/**/*'
