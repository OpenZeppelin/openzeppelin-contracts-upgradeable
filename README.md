# <img src="logo.png" alt="OpenZeppelin" height="40px">

## OpenZeppelin Contracts Ethereum Package

[![NPM Package](https://img.shields.io/npm/v/@openzeppelin/contracts-ethereum-package.svg)](https://www.npmjs.org/package/@openzeppelin/contracts-ethereum-package)
[![Build Status](https://circleci.com/gh/OpenZeppelin/openzeppelin-contracts-ethereum-package.svg?style=shield)](https://circleci.com/gh/OpenZeppelin/openzeppelin-contracts-ethereum-package)

**OpenZeppelin Contracts is a library for secure smart contract development.** It provides implementations of standards like ERC20 and ERC721 which you can deploy as-is or extend to suit your needs, as well as Solidity components to build custom contracts and more complex decentralized systems.

This fork of OpenZeppelin is set up as a **reusable Ethereum Package**. It is deployed to the kovan, rinkeby, and ropsten test networks, as well as to the main Ethereum network. You can reuse any of the pre-deployed on-chain contracts by simply linking to them using the [OpenZeppelin CLI](https://docs.openzeppelin.com/cli), or reuse their Solidity source code as with the [vanilla version of OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts).

## Differences with OpenZeppelin Contracts

This package contains the same contracts as the vanilla [OpenZeppelin Contracts](https://github.com/openZeppelin/openzeppelin-contracts), but modified for use with upgradeable contracts. The main difference is that _all contracts in this package are potentially upgradeable_: you will notice that no contracts have constructors defined, but use [initializer functions](https://docs.openzeppelin.com/upgrades/writing-upgradeable#initializers) instead. Also, this package is set up as an Ethereum package, and provides a small set of pre-deployed logic contracts that can be used directly via the OpenZeppelin SDK, without needing to deploy them again.

All contracts have an `UpgradeSafe` suffix to avoid confusion with their counterparts in OpenZeppelin Contracts. For example, `ERC20` becomes `ERC20UpgradeSafe`.

All in all, **you should use this package instead of @openzeppelin/contracts if you are creating upgradeable contracts**.

## Install

```
npm install @openzeppelin/contracts-ethereum-package
```

## Deployed logic contracts

- [ERC20PresetMinterPauserUpgradeSafe]: ERC20 token with minter and pauser roles
- [ERC721PresetMinterPauserAutoIdUpgradeSafe]: ERC721 non-fungible token with minter and pauser roles, as well as incremental ids

## Using via the OpenZeppelin CLI

You can easily create upgradeable instances of any of the logic contracts listed above using the OpenZeppelin CLI. This will rely on the pre-deployed instances in mainnet, kovan, ropsten, or rinkeby, greatly reducing your gas deployment costs. To do this, just [create a new OpenZeppelin CLI project](https://docs.openzeppelin.com/cli/getting-started) and [link to this package](https://docs.openzeppelin.com/cli/dependencies#linking-the-contracts-ethereum-package).

```bash
$ mkdir mytoken && cd mytoken
$ npm init -y
$ npm install @openzeppelin/cli
$ npx oz init
$ npx oz link @openzeppelin/contracts-ethereum-package
> Installing...
$ npx oz deploy @openzeppelin/contracts-ethereum-package/ERC20PresetMinterPauserUpgradeSafe
```

To deploy a contract, use the `openzeppelin deploy` command. 

As an example, you can run the following to deploy an upgradeable ERC20 named MyToken, with symbol MYT and 18 decimals, with the deployer being a Minter and a Pauser.

```
$ npx oz deploy
No contracts found to compile.
? Choose the kind of deployment upgradeable
? Pick a network development
? Pick a contract to deploy @openzeppelin/contracts-ethereum-package/ERC20PresetMinterPauserUpgradeSafe
✓ Deploying @openzeppelin/contracts-ethereum-package dependency to network dev-1589433413492
All implementations are up to date
? Call a function to initialize the instance after creating it? Yes
? Select which function initialize(name: string, symbol: string)
? name: string: MyToken
? symbol: string: MYT
✓ Setting everything up to create contract instances
✓ Instance created at 0x59d3631c86BbE35EF041872d502F218A39FBa150
To upgrade this instance run 'oz upgrade'
0x59d3631c86BbE35EF041872d502F218A39FBa150
```

OpenZeppelin will create an upgradeable ERC20 instance and keep track of its address in the `.openzeppelin/<network>.json` file. Should you update your version of the openzeppelin contracts ethereum package later down the road, you can simply run `npx oz upgrade` to upgrade your ERC20 instances to the latest version.

You can also deploy an ERC721 token by choosing the `ERC721PresetMinterPauserAutoIdUpgradeSafe` contract when running `npx oz deploy`. Refer to the `initialize` function of each of the predeployed logic contracts to see which parameters are required for initialization.

## Extending contracts

If you prefer to write your own custom contracts, import the ones from this package and extend them through inheritance. Note that **you must use this package and not `@openzeppelin/contracts` if you are [writing upgradeable contracts](https://docs.openzeppelin.com/upgrades/writing-upgradeable)**.

```solidity
pragma solidity ^0.6.2;

import "@openzeppelin/contracts-ethereum-package/contracts/Initializable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/presets/ERC721PresetMinterPauserAutoId.sol";


contract MyNFT is Initializable, ERC721PresetMinterPauserAutoIdUpgradeSafe {
    function initialize() public initializer {
        ERC721PresetMinterPauserAutoIdUpgradeSafe.initialize(
            "MyNFT",
            "MYN",
            "https://example.com/token/"
        );
    }
}
```

On our site you will find a few [guides] to learn about the different parts of OpenZeppelin, as well as [documentation for the API][API docs]. Keep in mind that the API docs are work in progress, and don’t hesitate to ask questions in [our forum][forum].

## Security

OpenZeppelin Contracts is maintained by [OpenZeppelin] the company, and developed following our high standards for code quality and security. OpenZeppelin Contracts is meant to provide tested and community-audited code, but please use common sense when doing anything that deals with real money! We take no responsibility for your implementation decisions and any security problems you might experience.

The core development principles and strategies that OpenZeppelin Contracts is based on include: security in depth, simple and modular code, clarity-driven naming conventions, comprehensive unit testing, pre-and-post-condition sanity checks, code consistency, and regular audits.

The latest audit was done on October 2018 on version 2.0.0.

Please report any security issues you find to security@openzeppelin.org.

## Contribute

OpenZeppelin exists thanks to its contributors. There are many ways you can participate and help build high quality software. Check out the [contribution guide]!

## License

OpenZeppelin is released under the [MIT License](LICENSE).

[API docs]: https://docs.openzeppelin.com/contracts/api/token/erc20
[guides]: https://docs.openzeppelin.com/contracts/
[forum]: https://forum.openzeppelin.com
[OpenZeppelin]: https://openzeppelin.com
[contribution guide]: CONTRIBUTING.md
[ERC20PresetMinterPauserUpgradeSafe]: https://docs.openzeppelin.com/contracts/3.x/api/presets#ERC20PresetMinterPauser
[ERC721PresetMinterPauserAutoIdUpgradeSafe]: https://docs.openzeppelin.com/contracts/3.x/api/presets#ERC721PresetMinterPauserAutoId
