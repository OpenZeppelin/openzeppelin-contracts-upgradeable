// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ERC20Upgradeable} from "../../token/ERC20/ERC20Upgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC20BlocklistMockUpgradeable is Initializable, ERC20Upgradeable {
    mapping(address user => bool) private _blocked;

    function __ERC20BlocklistMock_init() internal onlyInitializing {
    }

    function __ERC20BlocklistMock_init_unchained() internal onlyInitializing {
    }
    function _blockUser(address user) internal {
        _blocked[user] = true;
    }

    function _update(address from, address to, uint256 value) internal virtual override {
        require(!_blocked[from] && !_blocked[to]);
        super._update(from, to, value);
    }
}
