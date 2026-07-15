// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {AccessManagerUpgradeable} from "../access/manager/AccessManagerUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract AccessManagerMockUpgradeable is Initializable, AccessManagerUpgradeable {
    event CalledRestricted(address caller);
    event CalledUnrestricted(address caller);

    function __AccessManagerMock_init(address initialAdmin) internal onlyInitializing {
        __AccessManager_init_unchained(initialAdmin);
    }

    function __AccessManagerMock_init_unchained(address) internal onlyInitializing {}

    function fnRestricted() public onlyAuthorized {
        emit CalledRestricted(msg.sender);
    }

    function fnUnrestricted() public {
        emit CalledUnrestricted(msg.sender);
    }
}
