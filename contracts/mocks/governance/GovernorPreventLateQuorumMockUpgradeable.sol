// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../governance/extensions/GovernorPreventLateQuorumUpgradeable.sol";
import "../../governance/extensions/GovernorSettingsUpgradeable.sol";
import "../../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import "../../governance/extensions/GovernorVotesUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

abstract contract GovernorPreventLateQuorumMockUpgradeable is
    Initializable, GovernorSettingsUpgradeable,
    GovernorVotesUpgradeable,
    GovernorCountingSimpleUpgradeable,
    GovernorPreventLateQuorumUpgradeable
{
    uint256 private _quorum;

    function __GovernorPreventLateQuorumMock_init(uint256 quorum_) internal onlyInitializing {
        __GovernorPreventLateQuorumMock_init_unchained(quorum_);
    }

    function __GovernorPreventLateQuorumMock_init_unchained(uint256 quorum_) internal onlyInitializing {
        _quorum = quorum_;
    }

    function quorum(uint256) public view override returns (uint256) {
        return _quorum;
    }

    function proposalDeadline(
        uint256 proposalId
    ) public view override(GovernorUpgradeable, GovernorPreventLateQuorumUpgradeable) returns (uint256) {
        return super.proposalDeadline(proposalId);
    }

    function proposalThreshold() public view override(GovernorUpgradeable, GovernorSettingsUpgradeable) returns (uint256) {
        return super.proposalThreshold();
    }

    function _castVote(
        uint256 proposalId,
        address account,
        uint8 support,
        string memory reason,
        bytes memory params
    ) internal override(GovernorUpgradeable, GovernorPreventLateQuorumUpgradeable) returns (uint256) {
        return super._castVote(proposalId, account, support, reason, params);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}
