// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../access/AccessControlUpgradeSafe.sol";
import "../Initializable.sol";

contract AccessControlMockUpgradeSafe is __Initializable, AccessControlUpgradeSafe {
    function __AccessControlMock_init() internal __initializer {
        __Context_init_unchained();
        __AccessControl_init_unchained();
        __AccessControlMock_init_unchained();
    }

    function __AccessControlMock_init_unchained() internal __initializer {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

    function setRoleAdmin(bytes32 roleId, bytes32 adminRoleId) public {
        _setRoleAdmin(roleId, adminRoleId);
    }
    uint256[50] private __gap;
}
