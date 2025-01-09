// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.2.0) (governance/utils/VotesExtended.sol)
pragma solidity ^0.8.20;

import {Checkpoints} from "@openzeppelin/contracts/utils/structs/Checkpoints.sol";
import {VotesUpgradeable} from "./VotesUpgradeable.sol";
import {SafeCast} from "@openzeppelin/contracts/utils/math/SafeCast.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

/**
 * @dev Extension of {Votes} that adds checkpoints for delegations and balances.
 *
 * WARNING: While this contract extends {Votes}, valid uses of {Votes} may not be compatible with
 * {VotesExtended} without additional considerations. This implementation of {_transferVotingUnits} must
 * run AFTER the voting weight movement is registered, such that it is reflected on {_getVotingUnits}.
 *
 * Said differently, {VotesExtended} MUST be integrated in a way that calls {_transferVotingUnits} AFTER the
 * asset transfer is registered and balances are updated:
 *
 * ```solidity
 * contract VotingToken is Token, VotesExtended {
 *   function transfer(address from, address to, uint256 tokenId) public override {
 *     super.transfer(from, to, tokenId); // <- Perform the transfer first ...
 *     _transferVotingUnits(from, to, 1); // <- ... then call _transferVotingUnits.
 *   }
 *
 *   function _getVotingUnits(address account) internal view override returns (uint256) {
 *      return balanceOf(account);
 *   }
 * }
 * ```
 *
 * {ERC20Votes} and {ERC721Votes} follow this pattern and are thus safe to use with {VotesExtended}.
 */
abstract contract VotesExtendedUpgradeable is Initializable, VotesUpgradeable {
    using Checkpoints for Checkpoints.Trace160;
    using Checkpoints for Checkpoints.Trace208;

    /// @custom:storage-location erc7201:openzeppelin.storage.VotesExtended
    struct VotesExtendedStorage {
        mapping(address delegator => Checkpoints.Trace160) _userDelegationCheckpoints;
        mapping(address account => Checkpoints.Trace208) _userVotingUnitsCheckpoints;
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
        return address($._userDelegationCheckpoints[account].upperLookupRecent(_validateTimepoint(timepoint)));
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
        return $._userVotingUnitsCheckpoints[account].upperLookupRecent(_validateTimepoint(timepoint));
    }

    /// @inheritdoc VotesUpgradeable
    function _delegate(address account, address delegatee) internal virtual override {
        VotesExtendedStorage storage $ = _getVotesExtendedStorage();
        super._delegate(account, delegatee);

        $._userDelegationCheckpoints[account].push(clock(), uint160(delegatee));
    }

    /// @inheritdoc VotesUpgradeable
    function _transferVotingUnits(address from, address to, uint256 amount) internal virtual override {
        VotesExtendedStorage storage $ = _getVotesExtendedStorage();
        super._transferVotingUnits(from, to, amount);
        if (from != to) {
            if (from != address(0)) {
                $._userVotingUnitsCheckpoints[from].push(clock(), SafeCast.toUint208(_getVotingUnits(from)));
            }
            if (to != address(0)) {
                $._userVotingUnitsCheckpoints[to].push(clock(), SafeCast.toUint208(_getVotingUnits(to)));
            }
        }
    }
}
