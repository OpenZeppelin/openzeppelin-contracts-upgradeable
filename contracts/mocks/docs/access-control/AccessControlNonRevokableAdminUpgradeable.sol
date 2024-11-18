// contracts/AccessControlNonRevokableAdmin.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {AccessControlUpgradeable} from "../../../access/AccessControlUpgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

contract AccessControlNonRevokableAdminUpgradeable is Initializable, AccessControlUpgradeable {
    error AccessControlNonRevokable();

    function __AccessControlNonRevokableAdmin_init() internal onlyInitializing {
    }

    function __AccessControlNonRevokableAdmin_init_unchained() internal onlyInitializing {
    }
    function revokeRole(bytes32 role, address account) public override {
        if (role == DEFAULT_ADMIN_ROLE) {
            revert AccessControlNonRevokable();
        }

        super.revokeRole(role, account);
    }
}
