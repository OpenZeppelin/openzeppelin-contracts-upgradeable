// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "../access/AccessControlCrossChainUpgradeable.sol";
import "../crosschain/arbitrum/CrossChainEnabledArbitrumL2Upgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract AccessControlCrossChainMockUpgradeable is Initializable, AccessControlCrossChainUpgradeable, CrossChainEnabledArbitrumL2Upgradeable {
    function __AccessControlCrossChainMock_init() internal onlyInitializing {
        __AccessControlCrossChainMock_init_unchained();
    }

    function __AccessControlCrossChainMock_init_unchained() internal onlyInitializing {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }

    function setRoleAdmin(bytes32 roleId, bytes32 adminRoleId) public {
        _setRoleAdmin(roleId, adminRoleId);
    }

    function senderProtected(bytes32 roleId) public onlyRole(roleId) {}

    function crossChainRoleAlias(bytes32 role) public pure returns (bytes32) {
        return _crossChainRoleAlias(role);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
