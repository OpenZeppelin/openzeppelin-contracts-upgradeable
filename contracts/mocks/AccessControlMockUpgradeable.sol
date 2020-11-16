// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../access/AccessControlUpgradeable.sol";
import "../proxy/Initializable.sol";

contract AccessControlMockUpgradeable is Initializable, AccessControlUpgradeable {
    function __AccessControlMock_init() internal initializer {
        __Context_init_unchained();
        __AccessControl_init_unchained();
        __AccessControlMock_init_unchained();
    }

    function __AccessControlMock_init_unchained() internal initializer {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

    function setRoleAdmin(bytes32 roleId, bytes32 adminRoleId) public {
        _setRoleAdmin(roleId, adminRoleId);
    }
    uint256[50] private __gap;
}
