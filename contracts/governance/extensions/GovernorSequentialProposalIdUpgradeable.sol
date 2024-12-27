// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {GovernorUpgradeable} from "../GovernorUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

/**
 * @dev Extension of {Governor} that changes the numbering of proposal ids from the default hash-based approach to
 * sequential ids.
 */
abstract contract GovernorSequentialProposalIdUpgradeable is Initializable, GovernorUpgradeable {
    /// @custom:storage-location erc7201:openzeppelin.storage.GovernorSequentialProposalId
    struct GovernorSequentialProposalIdStorage {
        uint256 _latestProposalId;
        mapping(uint256 proposalHash => uint256 proposalId) _proposalIds;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.GovernorSequentialProposalId")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant GovernorSequentialProposalIdStorageLocation = 0x4b8c47b641115bbb755a0530712d89d8042b41728d36570a6119c90ae1b76800;

    function _getGovernorSequentialProposalIdStorage() private pure returns (GovernorSequentialProposalIdStorage storage $) {
        assembly {
            $.slot := GovernorSequentialProposalIdStorageLocation
        }
    }

    /**
     * @dev The {latestProposalId} may only be initialized if it hasn't been set yet
     * (through initialization or the creation of a proposal).
     */
    error GovernorAlreadyInitializedLatestProposalId();

    function __GovernorSequentialProposalId_init() internal onlyInitializing {
    }

    function __GovernorSequentialProposalId_init_unchained() internal onlyInitializing {
    }
    /**
     * @dev See {IGovernor-getProposalId}.
     */
    function getProposalId(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) public view virtual override returns (uint256) {
        GovernorSequentialProposalIdStorage storage $ = _getGovernorSequentialProposalIdStorage();
        uint256 proposalHash = hashProposal(targets, values, calldatas, descriptionHash);
        uint256 storedProposalId = $._proposalIds[proposalHash];
        if (storedProposalId == 0) {
            revert GovernorNonexistentProposal(0);
        }
        return storedProposalId;
    }

    /**
     * @dev Returns the latest proposal id. A return value of 0 means no proposals have been created yet.
     */
    function latestProposalId() public view virtual returns (uint256) {
        GovernorSequentialProposalIdStorage storage $ = _getGovernorSequentialProposalIdStorage();
        return $._latestProposalId;
    }

    /**
     * @dev See {IGovernor-_propose}.
     * Hook into the proposing mechanism to increment proposal count.
     */
    function _propose(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        string memory description,
        address proposer
    ) internal virtual override returns (uint256) {
        GovernorSequentialProposalIdStorage storage $ = _getGovernorSequentialProposalIdStorage();
        uint256 proposalHash = hashProposal(targets, values, calldatas, keccak256(bytes(description)));
        uint256 storedProposalId = $._proposalIds[proposalHash];
        if (storedProposalId == 0) {
            $._proposalIds[proposalHash] = ++$._latestProposalId;
        }
        return super._propose(targets, values, calldatas, description, proposer);
    }

    /**
     * @dev Internal function to set the {latestProposalId}. This function is helpful when transitioning
     * from another governance system. The next proposal id will be `newLatestProposalId` + 1.
     *
     * May only call this function if the current value of {latestProposalId} is 0.
     */
    function _initializeLatestProposalId(uint256 newLatestProposalId) internal virtual {
        GovernorSequentialProposalIdStorage storage $ = _getGovernorSequentialProposalIdStorage();
        if ($._latestProposalId != 0) {
            revert GovernorAlreadyInitializedLatestProposalId();
        }
        $._latestProposalId = newLatestProposalId;
    }
}
