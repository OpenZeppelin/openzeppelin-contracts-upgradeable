// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IFxMessageProcessorUpgradeable {
    function processMessageFromRoot(
        uint256 stateId,
        address rootMessageSender,
        bytes calldata data
    ) external;
}
