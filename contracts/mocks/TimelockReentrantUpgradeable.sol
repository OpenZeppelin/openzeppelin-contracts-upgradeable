// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { AddressUpgradeable } from "../utils/AddressUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract TimelockReentrantUpgradeable is Initializable {
    address private _reenterTarget;
    bytes private _reenterData;
    bool _reentered;

    function __TimelockReentrant_init() internal onlyInitializing {
    }

    function __TimelockReentrant_init_unchained() internal onlyInitializing {
    }
    function disableReentrancy() external {
        _reentered = true;
    }

    function enableRentrancy(address target, bytes calldata data) external {
        _reenterTarget = target;
        _reenterData = data;
    }

    function reenter() external {
        if (!_reentered) {
            _reentered = true;
            AddressUpgradeable.functionCall(_reenterTarget, _reenterData);
        }
    }
}
