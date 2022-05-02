// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (access/AccessControlCrossChain.sol)

pragma solidity ^0.8.4;

import "./AccessControlUpgradeable.sol";
import "../crosschain/CrossChainEnabledUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

/**
 * @dev An extension to {AccessControl} with support for cross-chain access management.
 * For each role, is extension implements an equivalent "aliased" role that is used for
 * restricting calls originating from other chains.
 *
 * For example, if a function `myFunction` is protected by `onlyRole(SOME_ROLE)`, and
 * if an address `x` has role `SOME_ROLE`, it would be able to call `myFunction` directly.
 * A wallet or contract at the same address on another chain would however not be able
 * to call this function. In order to do so, it would require to have the role
 * `_crossChainRoleAlias(SOME_ROLE)`.
 *
 * This aliasing is required to protect against multiple contracts living at the same
 * address on different chains but controlled by conflicting entities.
 *
 * _Available since v4.6._
 */
abstract contract AccessControlCrossChainUpgradeable is Initializable, AccessControlUpgradeable, CrossChainEnabledUpgradeable {
    function __AccessControlCrossChain_init() internal onlyInitializing {
    }

    function __AccessControlCrossChain_init_unchained() internal onlyInitializing {
    }
    bytes32 public constant CROSSCHAIN_ALIAS = keccak256("CROSSCHAIN_ALIAS");

    /**
     * @dev See {AccessControl-_checkRole}.
     */
    function _checkRole(bytes32 role) internal view virtual override {
        if (_isCrossChain()) {
            _checkRole(_crossChainRoleAlias(role), _crossChainSender());
        } else {
            super._checkRole(role);
        }
    }

    /**
     * @dev Returns the aliased role corresponding to `role`.
     */
    function _crossChainRoleAlias(bytes32 role) internal pure virtual returns (bytes32) {
        return role ^ CROSSCHAIN_ALIAS;
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
