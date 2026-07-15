// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {GovernorUpgradeable} from "../../governance/GovernorUpgradeable.sol";
import {GovernorSettingsUpgradeable} from "../../governance/extensions/GovernorSettingsUpgradeable.sol";
import {GovernorCountingSimpleUpgradeable} from "../../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import {GovernorVotesQuorumFractionUpgradeable} from "../../governance/extensions/GovernorVotesQuorumFractionUpgradeable.sol";
import {GovernorSequentialProposalIdUpgradeable} from "../../governance/extensions/GovernorSequentialProposalIdUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract GovernorSequentialProposalIdMockUpgradeable is
    Initializable, GovernorSettingsUpgradeable,
    GovernorVotesQuorumFractionUpgradeable,
    GovernorCountingSimpleUpgradeable,
    GovernorSequentialProposalIdUpgradeable
{
    function __GovernorSequentialProposalIdMock_init() internal onlyInitializing {
    }

    function __GovernorSequentialProposalIdMock_init_unchained() internal onlyInitializing {
    }
    function proposalThreshold() public view override(GovernorUpgradeable, GovernorSettingsUpgradeable) returns (uint256) {
        return super.proposalThreshold();
    }

    function getProposalId(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) public view virtual override(GovernorUpgradeable, GovernorSequentialProposalIdUpgradeable) returns (uint256) {
        return super.getProposalId(targets, values, calldatas, descriptionHash);
    }

    function _propose(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        string memory description,
        address proposer
    ) internal virtual override(GovernorUpgradeable, GovernorSequentialProposalIdUpgradeable) returns (uint256 proposalId) {
        return super._propose(targets, values, calldatas, description, proposer);
    }
}
