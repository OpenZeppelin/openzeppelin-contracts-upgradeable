// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../../governance/extensions/GovernorProposalThresholdUpgradeable.sol";
import "../../governance/extensions/GovernorSettingsUpgradeable.sol";
import "../../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import "../../governance/extensions/GovernorVotesQuorumFractionUpgradeable.sol";
import "../../proxy/utils/Initializable.sol";

abstract contract GovernorMockUpgradeable is
    Initializable, GovernorProposalThresholdUpgradeable,
    GovernorSettingsUpgradeable,
    GovernorVotesQuorumFractionUpgradeable,
    GovernorCountingSimpleUpgradeable
{
    function __GovernorMock_init() internal onlyInitializing {
    }

    function __GovernorMock_init_unchained() internal onlyInitializing {
    }
    function proposalThreshold() public view override(GovernorUpgradeable, GovernorSettingsUpgradeable) returns (uint256) {
        return super.proposalThreshold();
    }

    function propose(
        address[] memory targets,
        uint256[] memory values,
        bytes[] memory calldatas,
        string memory description
    ) public override(GovernorUpgradeable, GovernorProposalThresholdUpgradeable) returns (uint256) {
        return super.propose(targets, values, calldatas, description);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
