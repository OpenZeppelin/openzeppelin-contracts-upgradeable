// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {GovernorUpgradeable} from "../../governance/GovernorUpgradeable.sol";
import {GovernorSettingsUpgradeable} from "../../governance/extensions/GovernorSettingsUpgradeable.sol";
import {GovernorSuperQuorumUpgradeable} from "../../governance/extensions/GovernorSuperQuorumUpgradeable.sol";
import {GovernorCountingSimpleUpgradeable} from "../../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import {GovernorVotesSuperQuorumFractionUpgradeable} from "../../governance/extensions/GovernorVotesSuperQuorumFractionUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract GovernorVotesSuperQuorumFractionMockUpgradeable is
    Initializable, GovernorSettingsUpgradeable,
    GovernorVotesSuperQuorumFractionUpgradeable,
    GovernorCountingSimpleUpgradeable
{
    function __GovernorVotesSuperQuorumFractionMock_init() internal onlyInitializing {
    }

    function __GovernorVotesSuperQuorumFractionMock_init_unchained() internal onlyInitializing {
    }
    function proposalThreshold() public view override(GovernorUpgradeable, GovernorSettingsUpgradeable) returns (uint256) {
        return super.proposalThreshold();
    }

    function proposalVotes(
        uint256 proposalId
    )
        public
        view
        virtual
        override(GovernorCountingSimpleUpgradeable, GovernorSuperQuorumUpgradeable)
        returns (uint256 againstVotes, uint256 forVotes, uint256 abstainVotes)
    {
        return super.proposalVotes(proposalId);
    }

    function state(
        uint256 proposalId
    ) public view override(GovernorUpgradeable, GovernorVotesSuperQuorumFractionUpgradeable) returns (ProposalState) {
        return super.state(proposalId);
    }
}
