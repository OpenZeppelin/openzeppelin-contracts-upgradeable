#!/usr/bin/env bash

#  ./publish-upgradeable.sh 5.4
VERSION=$1 # 5.4
ROOT=$(pwd $(dirname $0))
cd $ROOT
git clone --recurse-submodules git@github.com:OpenZeppelin/openzeppelin-contracts-upgradeable.git
cd $ROOT/openzeppelin-contracts-upgradeable
git checkout release-v$VERSION
npm ci
git tag -m {,}v$(jq -r .version package.json)
cd $ROOT
git clone --recurse-submodules git@github.com:OpenZeppelin/openzeppelin-contracts-upgradeable.git
cd $ROOT/openzeppelin-contracts
git checkout release-v$VERSION
cd $ROOT 
cp -r openzeppelin-contracts/contracts openzeppelin-contracts-upgradeable/lib/openzeppelin-contracts
cd $ROOT/openzeppelin-contracts-upgradeable/contracts
npm publish
