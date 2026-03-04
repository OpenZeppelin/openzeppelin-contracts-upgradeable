// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {GovernorUpgradeable} from "../../governance/GovernorUpgradeable.sol";
import {GovernorSettingsUpgradeable} from "../../governance/extensions/GovernorSettingsUpgradeable.sol";
import {GovernorCountingSimpleUpgradeable} from "../../governance/extensions/GovernorCountingSimpleUpgradeable.sol";
import {GovernorVotesQuorumFractionUpgradeable} from "../../governance/extensions/GovernorVotesQuorumFractionUpgradeable.sol";
import {GovernorCrosschainUpgradeable} from "../../governance/extensions/GovernorCrosschainUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract GovernorCrosschainMockUpgradeable is
    Initializable, GovernorSettingsUpgradeable,
    GovernorVotesQuorumFractionUpgradeable,
    GovernorCountingSimpleUpgradeable,
    GovernorCrosschainUpgradeable
{
    function __GovernorCrosschainMock_init() internal onlyInitializing {
    }

    function __GovernorCrosschainMock_init_unchained() internal onlyInitializing {
    }
    function proposalThreshold() public view override(GovernorUpgradeable, GovernorSettingsUpgradeable) returns (uint256) {
        return super.proposalThreshold();
    }
}
