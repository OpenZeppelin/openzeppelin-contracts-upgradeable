// contracts/AccessControlModified.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {AccessControlUpgradeable} from "../../../access/AccessControlUpgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

contract AccessControlModifiedUpgradeable is Initializable, AccessControlUpgradeable {
    error AccessControlNonRevokable();

    function __AccessControlModified_init() internal onlyInitializing {
    }

    function __AccessControlModified_init_unchained() internal onlyInitializing {
    }
    // Override the revokeRole function
    function revokeRole(bytes32, address) public pure override {
        revert AccessControlNonRevokable();
    }
}
