#!/usr/bin/env bash

set -euo pipefail -x

npm run compile

npx @openzeppelin/upgrade-safe-transpiler -D
