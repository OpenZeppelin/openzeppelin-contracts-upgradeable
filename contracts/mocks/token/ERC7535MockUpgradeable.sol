// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

// `IERC20` is used by the upgradeable transpilation, which inlines the `ERC7535` constructor argument into this mock.
// forge-lint: disable-next-line(unused-import)
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {ERC20Upgradeable} from "../../token/ERC20/ERC20Upgradeable.sol";
import {ERC7535Upgradeable} from "../../token/ERC20/extensions/ERC7535Upgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

// Concrete (non-exposed) vault: the `$` wrapper adds a `receive` function, which ERC7535 deliberately lacks.
contract ERC7535MockUpgradeable is Initializable, ERC7535Upgradeable {
    function __ERC7535Mock_init() internal onlyInitializing {
        __ERC20_init_unchained("ERC7535Mock", "E7535M");
        __ERC4626_init_unchained(IERC20(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE));
    }

    function __ERC7535Mock_init_unchained() internal onlyInitializing {}
}
