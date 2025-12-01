// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {IERC7786GatewaySource} from "@openzeppelin/contracts/interfaces/draft-IERC7786.sol";
import {InteroperableAddress} from "@openzeppelin/contracts/utils/draft-InteroperableAddress.sol";
import {Bytes} from "@openzeppelin/contracts/utils/Bytes.sol";
import {ERC7786RecipientUpgradeable} from "./ERC7786RecipientUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Core bridging mechanism.
 *
 * This contract contains the logic to register and send messages to counterparts on remote chains using ERC-7786
 * gateways. It ensure received messages originate from a counterpart. This is the base of token bridges such as
 * {BridgeERC20Core}.
 *
 * Contracts that inherit from this contract can use the internal {_sendMessageToCounterpart} to send messages to their
 * counterpart on a foreign chain. They must override the {_processMessage} function to handle messages that have
 * been verified.
 */
abstract contract CrosschainLinkedUpgradeable is Initializable, ERC7786RecipientUpgradeable {
    using Bytes for bytes;
    using InteroperableAddress for bytes;

    struct Link {
        address gateway;
        bytes counterpart; // Full InteroperableAddress (chain ref + address)
    }
    /// @custom:storage-location erc7201:openzeppelin.storage.CrosschainLinked
    struct CrosschainLinkedStorage {
        mapping(bytes chain => Link) _links;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.CrosschainLinked")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant CrosschainLinkedStorageLocation = 0xb1919b8acb826911820798909343454eff798c0ea16342cfea7647f1c8b2df00;

    function _getCrosschainLinkedStorage() private pure returns (CrosschainLinkedStorage storage $) {
        assembly {
            $.slot := CrosschainLinkedStorageLocation
        }
    }

    /**
     * @dev Emitted when a new link is registered.
     *
     * Note: the `counterpart` argument is a full InteroperableAddress (chain ref + address).
     */
    event LinkRegistered(address gateway, bytes counterpart);

    /**
     * @dev Reverted when trying to register a link for a chain that is already registered.
     *
     * Note: the `chain` argument is a "chain-only" InteroperableAddress (empty address).
     */
    error LinkAlreadyRegistered(bytes chain);

    function __CrosschainLinked_init(Link[] memory links) internal onlyInitializing {
        __CrosschainLinked_init_unchained(links);
    }

    function __CrosschainLinked_init_unchained(Link[] memory links) internal onlyInitializing {
        for (uint256 i = 0; i < links.length; ++i) {
            _setLink(links[i].gateway, links[i].counterpart, false);
        }
    }

    /**
     * @dev Returns the ERC-7786 gateway used for sending and receiving cross-chain messages to a given chain.
     *
     * Note: The `chain` parameter is a "chain-only" InteroperableAddress (empty address) and the `counterpart` returns
     * the full InteroperableAddress (chain ref + address) that is on `chain`.
     */
    function getLink(bytes memory chain) public view virtual returns (address gateway, bytes memory counterpart) {
        CrosschainLinkedStorage storage $ = _getCrosschainLinkedStorage();
        Link storage self = $._links[chain];
        return (self.gateway, self.counterpart);
    }

    /**
     * @dev Internal setter to change the ERC-7786 gateway and counterpart for a given chain. Called at construction.
     *
     * Note: The `counterpart` parameter is the full InteroperableAddress (chain ref + address).
     */
    function _setLink(address gateway, bytes memory counterpart, bool allowOverride) internal virtual {
        CrosschainLinkedStorage storage $ = _getCrosschainLinkedStorage();
        // Sanity check, this should revert if gateway is not an ERC-7786 implementation. Note that since
        // supportsAttribute returns data, an EOA would fail that test (nothing returned).
        IERC7786GatewaySource(gateway).supportsAttribute(bytes4(0));

        bytes memory chain = _extractChain(counterpart);
        if (allowOverride || $._links[chain].gateway == address(0)) {
            $._links[chain] = Link(gateway, counterpart);
            emit LinkRegistered(gateway, counterpart);
        } else {
            revert LinkAlreadyRegistered(chain);
        }
    }

    /**
     * @dev Internal messaging function
     *
     * Note: The `chain` parameter is a "chain-only" InteroperableAddress (empty address).
     */
    function _sendMessageToCounterpart(
        bytes memory chain,
        bytes memory payload,
        bytes[] memory attributes
    ) internal virtual returns (bytes32) {
        (address gateway, bytes memory counterpart) = getLink(chain);
        return IERC7786GatewaySource(gateway).sendMessage(counterpart, payload, attributes);
    }

    /// @inheritdoc ERC7786RecipientUpgradeable
    function _isAuthorizedGateway(
        address instance,
        bytes calldata sender
    ) internal view virtual override returns (bool) {
        (address gateway, bytes memory router) = getLink(_extractChain(sender));
        return instance == gateway && sender.equal(router);
    }

    function _extractChain(bytes memory self) private pure returns (bytes memory) {
        (bytes2 chainType, bytes memory chainReference, ) = self.parseV1();
        return InteroperableAddress.formatV1(chainType, chainReference, hex"");
    }
}
