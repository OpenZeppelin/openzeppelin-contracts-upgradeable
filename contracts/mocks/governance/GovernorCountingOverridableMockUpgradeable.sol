// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {GovernorUpgradeable} from "../../governance/GovernorUpgradeable.sol";
import {GovernorSettingsUpgradeable} from "../../governance/extensions/GovernorSettingsUpgradeable.sol";
import {GovernorVotesQuorumFractionUpgradeable} from "../../governance/extensions/GovernorVotesQuorumFractionUpgradeable.sol";
import {GovernorCountingOverridableUpgradeable, VotesExtendedUpgradeable} from "../../governance/extensions/GovernorCountingOverridableUpgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

abstract contract GovernorCountingOverridableMockUpgradeable is
    Initializable, GovernorSettingsUpgradeable,
    GovernorVotesQuorumFractionUpgradeable,
    GovernorCountingOverridableUpgradeable
{
    function __GovernorCountingOverridableMock_init() internal onlyInitializing {
    }

    function __GovernorCountingOverridableMock_init_unchained() internal onlyInitializing {
    }
    function proposalThreshold() public view override(GovernorUpgradeable, GovernorSettingsUpgradeable) returns (uint256) {
        return super.proposalThreshold();
    }
}
