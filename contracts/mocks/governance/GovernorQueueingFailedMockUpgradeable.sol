// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {GovernorMockUpgradeable} from "./GovernorMockUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/// @dev Mock that signals queueing is required but inherits the base `_queueOperations` that returns 0,
/// triggering `GovernorProposalQueueingFailed` from `Governor.queue`.
abstract contract GovernorQueueingFailedMockUpgradeable is Initializable, GovernorMockUpgradeable {
    function __GovernorQueueingFailedMock_init() internal onlyInitializing {
    }

    function __GovernorQueueingFailedMock_init_unchained() internal onlyInitializing {
    }
    function proposalNeedsQueuing(uint256) public pure override returns (bool) {
        return true;
    }
}
