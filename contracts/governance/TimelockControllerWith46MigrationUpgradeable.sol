// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.6.0 (governance/TimelockControllerWith46Migration.sol)

pragma solidity ^0.8.0;

import "./TimelockControllerUpgradeable.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

/**
 * @dev Extension of the TimelockController that includes an additional
 * function to migrate from OpenZeppelin Upgradeable Contracts <4.6 to >=4.6.
 *
 * This migration is necessary to setup administration rights over the new
 * `CANCELLER_ROLE`.
 *
 * The migration is trustless and can be performed by anyone.
 *
 * _Available since v4.6._
 */
contract TimelockControllerWith46MigrationUpgradeable is Initializable, TimelockControllerUpgradeable {
    function __TimelockControllerWith46Migration_init(
        uint256 minDelay,
        address[] memory proposers,
        address[] memory executors,
        address admin
    ) internal onlyInitializing {
        __TimelockController_init_unchained(minDelay, proposers, executors, admin);
    }

    function __TimelockControllerWith46Migration_init_unchained(
        uint256,
        address[] memory,
        address[] memory,
        address
    ) internal onlyInitializing {}

    /**
     * @dev Migration function. Running it is necessary for upgradeable
     * instances that were initially setup with code <4.6 and that upgraded
     * to >=4.6.
     */
    function migrateTo46() public virtual {
        require(
            getRoleAdmin(PROPOSER_ROLE) == TIMELOCK_ADMIN_ROLE && getRoleAdmin(CANCELLER_ROLE) == DEFAULT_ADMIN_ROLE,
            "TimelockController: already migrated"
        );
        _setRoleAdmin(CANCELLER_ROLE, TIMELOCK_ADMIN_ROLE);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
