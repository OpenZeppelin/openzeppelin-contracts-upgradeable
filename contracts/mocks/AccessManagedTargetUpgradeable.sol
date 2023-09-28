// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {AccessManagedUpgradeable} from "../access/manager/AccessManagedUpgradeable.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

abstract contract AccessManagedTargetUpgradeable is Initializable, AccessManagedUpgradeable {
    event CalledRestricted(address caller);
    event CalledUnrestricted(address caller);

    function __AccessManagedTarget_init() internal onlyInitializing {
    }

    function __AccessManagedTarget_init_unchained() internal onlyInitializing {
    }
    function fnRestricted() public restricted {
        emit CalledRestricted(msg.sender);
    }

    function fnUnrestricted() public {
        emit CalledUnrestricted(msg.sender);
    }
}
