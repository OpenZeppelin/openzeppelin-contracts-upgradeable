// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

// Used by the upgradeable transpilation, which inlines the `ERC7535` constructor argument into this mock.
// forge-lint: disable-next-line(unused-import)
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {ERC7535Upgradeable} from "../../token/ERC20/extensions/ERC7535Upgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC7535DepositHookMockUpgradeable is Initializable, ERC7535Upgradeable {
    event TotalAssetsAfterDeposit(uint256 totalAssets);

    function __ERC7535DepositHookMock_init() internal onlyInitializing {
        __ERC4626_init_unchained(IERC20(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE));
    }

    function __ERC7535DepositHookMock_init_unchained() internal onlyInitializing {
    }
    function _deposit(address caller, address receiver, uint256 assets, uint256 shares) internal virtual override {
        super._deposit(caller, receiver, assets, shares);
        emit TotalAssetsAfterDeposit(totalAssets());
    }
}
