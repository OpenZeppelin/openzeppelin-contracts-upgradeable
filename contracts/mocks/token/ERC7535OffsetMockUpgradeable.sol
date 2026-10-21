// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

// Used by the upgradeable transpilation, which inlines the `ERC7535` constructor argument into this mock.
// forge-lint: disable-next-line(unused-import)
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {ERC7535Upgradeable} from "../../token/ERC20/extensions/ERC7535Upgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC7535OffsetMockUpgradeable is Initializable, ERC7535Upgradeable {
    uint8 private _offset;

    function __ERC7535OffsetMock_init(uint8 offset_) internal onlyInitializing {
        __ERC4626_init_unchained(IERC20(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE));
        __ERC7535OffsetMock_init_unchained(offset_);
    }

    function __ERC7535OffsetMock_init_unchained(uint8 offset_) internal onlyInitializing {
        _offset = offset_;
    }

    function _decimalsOffset() internal view virtual override returns (uint8) {
        return _offset;
    }
}
