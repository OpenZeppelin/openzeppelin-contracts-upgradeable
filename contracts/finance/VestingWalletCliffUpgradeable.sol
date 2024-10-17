// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.1.0) (finance/VestingWalletCliff.sol)

pragma solidity ^0.8.20;

import {SafeCast} from "@openzeppelin/contracts/utils/math/SafeCast.sol";
import {VestingWalletUpgradeable} from "./VestingWalletUpgradeable.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

/**
 * @dev Extension of {VestingWallet} that adds a cliff to the vesting schedule.
 *
 * _Available since v5.1._
 */
abstract contract VestingWalletCliffUpgradeable is Initializable, VestingWalletUpgradeable {
    using SafeCast for *;

    /// @custom:storage-location erc7201:openzeppelin.storage.VestingWalletCliff
    struct VestingWalletCliffStorage {
        uint64 _cliff;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.VestingWalletCliff")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant VestingWalletCliffStorageLocation = 0x0a0ceb66c7c9aef32c0bfc43d3108868a39e95e96162520745e462557492f100;

    function _getVestingWalletCliffStorage() private pure returns (VestingWalletCliffStorage storage $) {
        assembly {
            $.slot := VestingWalletCliffStorageLocation
        }
    }

    /// @dev The specified cliff duration is larger than the vesting duration.
    error InvalidCliffDuration(uint64 cliffSeconds, uint64 durationSeconds);

    /**
     * @dev Set the duration of the cliff, in seconds. The cliff starts vesting schedule (see {VestingWallet}'s
     * constructor) and ends `cliffSeconds` later.
     */
    function __VestingWalletCliff_init(uint64 cliffSeconds) internal onlyInitializing {
        __VestingWalletCliff_init_unchained(cliffSeconds);
    }

    function __VestingWalletCliff_init_unchained(uint64 cliffSeconds) internal onlyInitializing {
        VestingWalletCliffStorage storage $ = _getVestingWalletCliffStorage();
        if (cliffSeconds > duration()) {
            revert InvalidCliffDuration(cliffSeconds, duration().toUint64());
        }
        $._cliff = start().toUint64() + cliffSeconds;
    }

    /**
     * @dev Getter for the cliff timestamp.
     */
    function cliff() public view virtual returns (uint256) {
        VestingWalletCliffStorage storage $ = _getVestingWalletCliffStorage();
        return $._cliff;
    }

    /**
     * @dev Virtual implementation of the vesting formula. This returns the amount vested, as a function of time, for
     * an asset given its total historical allocation. Returns 0 if the {cliff} timestamp is not met.
     *
     * IMPORTANT: The cliff not only makes the schedule return 0, but it also ignores every possible side
     * effect from calling the inherited implementation (i.e. `super._vestingSchedule`). Carefully consider
     * this caveat if the overridden implementation of this function has any (e.g. writing to memory or reverting).
     */
    function _vestingSchedule(
        uint256 totalAllocation,
        uint64 timestamp
    ) internal view virtual override returns (uint256) {
        return timestamp < cliff() ? 0 : super._vestingSchedule(totalAllocation, timestamp);
    }
}
