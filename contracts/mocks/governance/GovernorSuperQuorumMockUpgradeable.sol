// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {GovernorUpgradeable} from "../../governance/GovernorUpgradeable.sol";
import {GovernorSettingsUpgradeable} from "../../governance/extensions/GovernorSettingsUpgradeable.sol";
import {GovernorVotesUpgradeable} from "../../governance/extensions/GovernorVotesUpgradeable.sol";
import {GovernorSuperQuorumUpgradeable} from "../../governance/extensions/GovernorSuperQuorumUpgradeable.sol";
import {GovernorCountingSimpleUpgradeable} from "../../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import {GovernorTimelockControlUpgradeable} from "../../governance/extensions/GovernorTimelockControlUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract GovernorSuperQuorumMockUpgradeable is
    Initializable, GovernorSettingsUpgradeable,
    GovernorVotesUpgradeable,
    GovernorTimelockControlUpgradeable,
    GovernorSuperQuorumUpgradeable,
    GovernorCountingSimpleUpgradeable
{
    uint256 private _quorum;
    uint256 private _superQuorum;

    function __GovernorSuperQuorumMock_init(uint256 quorum_, uint256 superQuorum_) internal onlyInitializing {
        __GovernorSuperQuorumMock_init_unchained(quorum_, superQuorum_);
    }

    function __GovernorSuperQuorumMock_init_unchained(uint256 quorum_, uint256 superQuorum_) internal onlyInitializing {
        _quorum = quorum_;
        _superQuorum = superQuorum_;
    }

    function quorum(uint256) public view override returns (uint256) {
        return _quorum;
    }

    function superQuorum(uint256) public view override returns (uint256) {
        return _superQuorum;
    }

    function state(
        uint256 proposalId
    ) public view override(GovernorUpgradeable, GovernorSuperQuorumUpgradeable, GovernorTimelockControlUpgradeable) returns (ProposalState) {
        return super.state(proposalId);
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

    function _cancel(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal override(GovernorUpgradeable, GovernorTimelockControlUpgradeable) returns (uint256) {
        return super._cancel(targets, values, calldatas, descriptionHash);
    }

    function _executeOperations(
        uint256 proposalId,
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal override(GovernorUpgradeable, GovernorTimelockControlUpgradeable) {
        super._executeOperations(proposalId, targets, values, calldatas, descriptionHash);
    }

    function _executor() internal view override(GovernorUpgradeable, GovernorTimelockControlUpgradeable) returns (address) {
        return super._executor();
    }

    function _queueOperations(
        uint256 proposalId,
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        bytes32 descriptionHash
    ) internal override(GovernorUpgradeable, GovernorTimelockControlUpgradeable) returns (uint48) {
        return super._queueOperations(proposalId, targets, values, calldatas, descriptionHash);
    }

    function proposalNeedsQueuing(
        uint256 proposalId
    ) public view override(GovernorUpgradeable, GovernorTimelockControlUpgradeable) returns (bool) {
        return super.proposalNeedsQueuing(proposalId);
    }
}
