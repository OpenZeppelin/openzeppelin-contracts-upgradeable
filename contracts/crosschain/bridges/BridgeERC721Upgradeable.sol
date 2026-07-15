// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.7.0-rc.0) (crosschain/bridges/BridgeERC721.sol)

pragma solidity ^0.8.26;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {IERC721Errors} from "@openzeppelin/contracts/interfaces/draft-IERC6093.sol";
import {BridgeNonFungibleUpgradeable} from "./abstract/BridgeNonFungibleUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * @dev This is a variant of {BridgeNonFungible} that implements the bridge logic for ERC-721 tokens that do not expose
 * a crosschain mint and burn mechanism. Instead, it takes custody of bridged assets.
 */
// slither-disable-next-line locked-ether
abstract contract BridgeERC721Upgradeable is Initializable, BridgeNonFungibleUpgradeable {
    /// @custom:storage-location erc7201:openzeppelin.storage.BridgeERC721
    struct BridgeERC721Storage {
        IERC721 _token;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.BridgeERC721")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant BridgeERC721StorageLocation = 0x22a00731eeae0eab5f0d23e4528cf50a151942e14977f594e2c7f77b2e662c00;

    function _getBridgeERC721Storage() private pure returns (BridgeERC721Storage storage $) {
        assembly {
            $.slot := BridgeERC721StorageLocation
        }
    }

    function __BridgeERC721_init(IERC721 token_) internal onlyInitializing {
        __BridgeERC721_init_unchained(token_);
    }

    function __BridgeERC721_init_unchained(IERC721 token_) internal onlyInitializing {
        BridgeERC721Storage storage $ = _getBridgeERC721Storage();
        $._token = token_;
    }

    /// @dev Return the address of the ERC721 token this bridge operates on.
    function token() public view virtual returns (IERC721) {
        BridgeERC721Storage storage $ = _getBridgeERC721Storage();
        return $._token;
    }

    /**
     * @dev Transfer `tokenId` from `from` (on this chain) to `to` (on a different chain).
     *
     * The `to` parameter is the full InteroperableAddress that references both the destination chain and the account
     * on that chain. Similarly to the underlying token's {ERC721-transferFrom} function, this function can be called
     * either by the token holder or by anyone that is approved by the token holder. It reuses the token's allowance
     * system, meaning that an account that is "approved for all" or "approved for tokenId" can perform the crosschain
     * transfer directly without having to take temporary custody of the token.
     */
    function crosschainTransferFrom(address from, bytes memory to, uint256 tokenId) public virtual returns (bytes32) {
        // Permission is handled using the ERC721's allowance system. This check replicates `ERC721._isAuthorized`.
        address spender = _msgSender();
        require(
            from == spender || token().isApprovedForAll(from, spender) || token().getApproved(tokenId) == spender,
            IERC721Errors.ERC721InsufficientApproval(spender, tokenId)
        );

        // This call verifies that `from` is the owner of `tokenId` (in `_onSend`), and the previous checks ensure
        // that `spender` is allowed to move tokenId on behalf of `from`.
        //
        // Perform the crosschain transfer and return the send id
        return _crosschainTransfer(from, to, tokenId);
    }

    /// @dev "Locking" tokens is done by taking custody
    function _onSend(address from, uint256 tokenId) internal virtual override {
        // slither-disable-next-line arbitrary-send-erc20
        token().transferFrom(from, address(this), tokenId);
    }

    /// @dev "Unlocking" tokens is done by releasing custody
    function _onReceive(address to, uint256 tokenId) internal virtual override {
        // slither-disable-next-line arbitrary-send-erc20
        token().transferFrom(address(this), to, tokenId);
    }
}
