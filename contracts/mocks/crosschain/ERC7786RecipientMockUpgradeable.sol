// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import {ERC7786RecipientUpgradeable} from "../../crosschain/ERC7786RecipientUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract ERC7786RecipientMockUpgradeable is Initializable, ERC7786RecipientUpgradeable {
    address private _gateway;

    event MessageReceived(address gateway, bytes32 receiveId, bytes sender, bytes payload, uint256 value);

    function __ERC7786RecipientMock_init(address gateway_) internal onlyInitializing {
        __ERC7786RecipientMock_init_unchained(gateway_);
    }

    function __ERC7786RecipientMock_init_unchained(address gateway_) internal onlyInitializing {
        _gateway = gateway_;
    }

    function _isAuthorizedGateway(
        address gateway,
        bytes calldata /*sender*/
    ) internal view virtual override returns (bool) {
        return gateway == _gateway;
    }

    function _processMessage(
        address gateway,
        bytes32 receiveId,
        bytes calldata sender,
        bytes calldata payload
    ) internal virtual override {
        emit MessageReceived(gateway, receiveId, sender, payload, msg.value);
    }
}
