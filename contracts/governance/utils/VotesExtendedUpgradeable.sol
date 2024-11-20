// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Checkpoints} from "@openzeppelin/contracts/utils/structs/Checkpoints.sol";
import {VotesUpgradeable} from "./VotesUpgradeable.sol";
import {SafeCast} from "@openzeppelin/contracts/utils/math/SafeCast.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

/**
 * @dev Extension of {Votes} that adds checkpoints for delegations and balances.
 */
abstract contract VotesExtendedUpgradeable is Initializable, VotesUpgradeable {
    using SafeCast for uint256;
    using Checkpoints for Checkpoints.Trace160;
    using Checkpoints for Checkpoints.Trace208;

    /// @custom:storage-location erc7201:openzeppelin.storage.VotesExtended
    struct VotesExtendedStorage {
        mapping(address delegatee => Checkpoints.Trace160) _delegateCheckpoints;
        mapping(address account => Checkpoints.Trace208) _balanceOfCheckpoints;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.VotesExtended")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant VotesExtendedStorageLocation = 0x4a7bc7aabb540021543c1f28dd259f8776612c96fd248bdcc6fdf56c7778d900;

    function _getVotesExtendedStorage() private pure returns (VotesExtendedStorage storage $) {
        assembly {
            $.slot := VotesExtendedStorageLocation
        }
    }

    function __VotesExtended_init() internal onlyInitializing {
    }

    function __VotesExtended_init_unchained() internal onlyInitializing {
    }
    /**
     * @dev Returns the delegate of an `account` at a specific moment in the past. If the `clock()` is
     * configured to use block numbers, this will return the value at the end of the corresponding block.
     *
     * Requirements:
     *
     * - `timepoint` must be in the past. If operating using block numbers, the block must be already mined.
     */
    function getPastDelegate(address account, uint256 timepoint) public view virtual returns (address) {
        VotesExtendedStorage storage $ = _getVotesExtendedStorage();
        uint48 currentTimepoint = clock();
        if (timepoint >= currentTimepoint) {
            revert ERC5805FutureLookup(timepoint, currentTimepoint);
        }
        return address($._delegateCheckpoints[account].upperLookupRecent(timepoint.toUint48()));
    }

    /**
     * @dev Returns the `balanceOf` of an `account` at a specific moment in the past. If the `clock()` is
     * configured to use block numbers, this will return the value at the end of the corresponding block.
     *
     * Requirements:
     *
     * - `timepoint` must be in the past. If operating using block numbers, the block must be already mined.
     */
    function getPastBalanceOf(address account, uint256 timepoint) public view virtual returns (uint256) {
        VotesExtendedStorage storage $ = _getVotesExtendedStorage();
        uint48 currentTimepoint = clock();
        if (timepoint >= currentTimepoint) {
            revert ERC5805FutureLookup(timepoint, currentTimepoint);
        }
        return $._balanceOfCheckpoints[account].upperLookupRecent(timepoint.toUint48());
    }

    /// @inheritdoc VotesUpgradeable
    function _delegate(address account, address delegatee) internal virtual override {
        VotesExtendedStorage storage $ = _getVotesExtendedStorage();
        super._delegate(account, delegatee);

        $._delegateCheckpoints[account].push(clock(), uint160(delegatee));
    }

    /// @inheritdoc VotesUpgradeable
    function _transferVotingUnits(address from, address to, uint256 amount) internal virtual override {
        VotesExtendedStorage storage $ = _getVotesExtendedStorage();
        super._transferVotingUnits(from, to, amount);
        if (from != to) {
            if (from != address(0)) {
                $._balanceOfCheckpoints[from].push(clock(), _getVotingUnits(from).toUint208());
            }
            if (to != address(0)) {
                $._balanceOfCheckpoints[to].push(clock(), _getVotingUnits(to).toUint208());
            }
        }
    }
}
