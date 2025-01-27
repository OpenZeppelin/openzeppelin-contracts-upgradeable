// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {GovernorUpgradeable} from "../../governance/GovernorUpgradeable.sol";
import {GovernorSettingsUpgradeable} from "../../governance/extensions/GovernorSettingsUpgradeable.sol";
import {GovernorCountingSimpleUpgradeable} from "../../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import {GovernorVotesQuorumFractionUpgradeable} from "../../governance/extensions/GovernorVotesQuorumFractionUpgradeable.sol";
import {GovernorProposalGuardianUpgradeable} from "../../governance/extensions/GovernorProposalGuardianUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract GovernorProposalGuardianMockUpgradeable is
    Initializable, GovernorSettingsUpgradeable,
    GovernorVotesQuorumFractionUpgradeable,
    GovernorCountingSimpleUpgradeable,
    GovernorProposalGuardianUpgradeable
{
    function __GovernorProposalGuardianMock_init() internal onlyInitializing {
    }

    function __GovernorProposalGuardianMock_init_unchained() internal onlyInitializing {
    }
    function proposalThreshold() public view override(GovernorUpgradeable, GovernorSettingsUpgradeable) returns (uint256) {
        return super.proposalThreshold();
    }

    function _validateCancel(
        uint256 proposalId,
        address caller
    ) internal view override(GovernorUpgradeable, GovernorProposalGuardianUpgradeable) returns (bool) {
        return super._validateCancel(proposalId, caller);
    }
}
