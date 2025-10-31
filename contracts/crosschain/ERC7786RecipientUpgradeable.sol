// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.5.0) (crosschain/ERC7786Recipient.sol)

pragma solidity ^0.8.20;

import {IERC7786Recipient} from "@openzeppelin/contracts/interfaces/draft-IERC7786.sol";
import {BitMaps} from "@openzeppelin/contracts/utils/structs/BitMaps.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Base implementation of an ERC-7786 compliant cross-chain message receiver.
 *
 * This abstract contract exposes the `receiveMessage` function that is used for communication with (one or multiple)
 * destination gateways. This contract leaves two functions unimplemented:
 *
 * * {_isAuthorizedGateway}, an internal getter used to verify whether an address is recognised by the contract as a
 * valid ERC-7786 destination gateway. One or multiple gateway can be supported. Note that any malicious address for
 * which this function returns true would be able to impersonate any account on any other chain sending any message.
 *
 * * {_processMessage}, the internal function that will be called with any message that has been validated.
 *
 * This contract implements replay protection, meaning that if two messages are received from the same gateway with the
 * same `receiveId`, then the second one will NOT be executed, regardless of the result of {_isAuthorizedGateway}.
 */
abstract contract ERC7786RecipientUpgradeable is Initializable, IERC7786Recipient {
    using BitMaps for BitMaps.BitMap;

    /// @custom:storage-location erc7201:openzeppelin.storage.ERC7786Recipient
    struct ERC7786RecipientStorage {
        mapping(address gateway => BitMaps.BitMap) _received;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.ERC7786Recipient")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ERC7786RecipientStorageLocation = 0x7d75506ec9b6d21d8b65a6ff14e8447c9f4ebcb3d04f3facb665dd26faeb5e00;

    function _getERC7786RecipientStorage() private pure returns (ERC7786RecipientStorage storage $) {
        assembly {
            $.slot := ERC7786RecipientStorageLocation
        }
    }

    error ERC7786RecipientUnauthorizedGateway(address gateway, bytes sender);
    error ERC7786RecipientMessageAlreadyProcessed(address gateway, bytes32 receiveId);

    function __ERC7786Recipient_init() internal onlyInitializing {
    }

    function __ERC7786Recipient_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc IERC7786Recipient
    function receiveMessage(
        bytes32 receiveId,
        bytes calldata sender, // Binary Interoperable Address
        bytes calldata payload
    ) external payable returns (bytes4) {
        ERC7786RecipientStorage storage $ = _getERC7786RecipientStorage();
        // Check authorization
        if (!_isAuthorizedGateway(msg.sender, sender)) {
            revert ERC7786RecipientUnauthorizedGateway(msg.sender, sender);
        }

        // Prevent duplicate execution
        if ($._received[msg.sender].get(uint256(receiveId))) {
            revert ERC7786RecipientMessageAlreadyProcessed(msg.sender, receiveId);
        }
        $._received[msg.sender].set(uint256(receiveId));

        _processMessage(msg.sender, receiveId, sender, payload);

        return IERC7786Recipient.receiveMessage.selector;
    }

    /**
     * @dev Virtual getter that returns whether an address is a valid ERC-7786 gateway for a given sender.
     *
     * The `sender` parameter is an interoperable address that include the source chain. The chain part can be
     * extracted using the {InteroperableAddress} library to selectively authorize gateways based on the origin chain
     * of a message.
     */
    function _isAuthorizedGateway(address gateway, bytes calldata sender) internal view virtual returns (bool);

    /// @dev Virtual function that should contain the logic to execute when a cross-chain message is received.
    function _processMessage(
        address gateway,
        bytes32 receiveId,
        bytes calldata sender,
        bytes calldata payload
    ) internal virtual;
}
