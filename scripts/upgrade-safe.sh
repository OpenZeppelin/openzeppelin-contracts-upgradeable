#!/usr/bin/env bash

set -euo pipefail

git checkout contracts
rm -rf build contracts/Initializable.sol

npm run compile

node ~/oz/transpiler/dist/cli.js

mv contracts/__upgradeable__ .
rm -rf contracts
mv __upgradeable__ contracts

git checkout $(git ls-files -d)

sed -i -e 's/(ERC1820Implementer/\0Upgradeable/' contracts/mocks/Create2Impl.sol

rs "contract\.fromArtifact\('(.*?Mock.*?)'\)" "contract.fromArtifact('\${1}Upgradeable')"

rs -w 'ContextMock context' 'ContextMockUpgradeable context' contracts/mocks/ContextMock.sol
rs -F 'GSNRecipient._msg' 'GSNRecipientUpgradeable._msg' contracts/mocks/{,ERC721}GSNRecipientMock.sol
rs '(new )Escrow|Escrow( private)' '${1}EscrowUpgradeable${2}' contracts/payment/PullPayment.sol
rs -w 'ReentrancyAttack attacker' 'ReentrancyAttackUpgradeable attacker' contracts/mocks/ReentrancyMock.sol
rs -F 'ERC20ReturnTrueMock(' 'ERC20ReturnTrueMockUpgradeable(' contracts/mocks/SafeERC20Helper.sol

rs ' +$' '' contracts

npm run compile
