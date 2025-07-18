// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.1.0) (token/ERC721/extensions/ERC721Wrapper.sol)

pragma solidity ^0.8.24;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {ERC721Upgradeable} from "../ERC721Upgradeable.sol";
import {IERC721Receiver} from "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev Extension of the ERC-721 token contract to support token wrapping.
 *
 * Users can deposit and withdraw an "underlying token" and receive a "wrapped token" with a matching tokenId. This is
 * useful in conjunction with other modules. For example, combining this wrapping mechanism with {ERC721Votes} will allow
 * the wrapping of an existing "basic" ERC-721 into a governance token.
 */
abstract contract ERC721WrapperUpgradeable is Initializable, ERC721Upgradeable, IERC721Receiver {
    /// @custom:storage-location erc7201:openzeppelin.storage.ERC721Wrapper
    struct ERC721WrapperStorage {
        IERC721 _underlying;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.ERC721Wrapper")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ERC721WrapperStorageLocation = 0xa27ade666fc2e768f0cfbad659dfd6a7039cae52f9274d2ab808f70dce364400;

    function _getERC721WrapperStorage() private pure returns (ERC721WrapperStorage storage $) {
        assembly {
            $.slot := ERC721WrapperStorageLocation
        }
    }

    /**
     * @dev The received ERC-721 token couldn't be wrapped.
     */
    error ERC721UnsupportedToken(address token);

    function __ERC721Wrapper_init(IERC721 underlyingToken) internal onlyInitializing {
        __ERC721Wrapper_init_unchained(underlyingToken);
    }

    function __ERC721Wrapper_init_unchained(IERC721 underlyingToken) internal onlyInitializing {
        ERC721WrapperStorage storage $ = _getERC721WrapperStorage();
        $._underlying = underlyingToken;
    }

    /**
     * @dev Allow a user to deposit underlying tokens and mint the corresponding tokenIds.
     */
    function depositFor(address account, uint256[] memory tokenIds) public virtual returns (bool) {
        uint256 length = tokenIds.length;
        for (uint256 i = 0; i < length; ++i) {
            uint256 tokenId = tokenIds[i];

            // This is an "unsafe" transfer that doesn't call any hook on the receiver. With underlying() being trusted
            // (by design of this contract) and no other contracts expected to be called from there, we are safe.
            // slither-disable-next-line reentrancy-no-eth
            underlying().transferFrom(_msgSender(), address(this), tokenId);
            _safeMint(account, tokenId);
        }

        return true;
    }

    /**
     * @dev Allow a user to burn wrapped tokens and withdraw the corresponding tokenIds of the underlying tokens.
     */
    function withdrawTo(address account, uint256[] memory tokenIds) public virtual returns (bool) {
        uint256 length = tokenIds.length;
        for (uint256 i = 0; i < length; ++i) {
            uint256 tokenId = tokenIds[i];
            // Setting an "auth" arguments enables the `_isAuthorized` check which verifies that the token exists
            // (from != 0). Therefore, it is not needed to verify that the return value is not 0 here.
            _update(address(0), tokenId, _msgSender());
            // Checks were already performed at this point, and there's no way to retake ownership or approval from
            // the wrapped tokenId after this point, so it's safe to remove the reentrancy check for the next line.
            // slither-disable-next-line reentrancy-no-eth
            underlying().safeTransferFrom(address(this), account, tokenId);
        }

        return true;
    }

    /**
     * @dev Overrides {IERC721Receiver-onERC721Received} to allow minting on direct ERC-721 transfers to
     * this contract.
     *
     * In case there's data attached, it validates that the operator is this contract, so only trusted data
     * is accepted from {depositFor}.
     *
     * WARNING: Doesn't work with unsafe transfers (eg. {IERC721-transferFrom}). Use {ERC721Wrapper-_recover}
     * for recovering in that scenario.
     */
    function onERC721Received(address, address from, uint256 tokenId, bytes memory) public virtual returns (bytes4) {
        if (address(underlying()) != _msgSender()) {
            revert ERC721UnsupportedToken(_msgSender());
        }
        _safeMint(from, tokenId);
        return IERC721Receiver.onERC721Received.selector;
    }

    /**
     * @dev Mint a wrapped token to cover any underlyingToken that would have been transferred by mistake. Internal
     * function that can be exposed with access control if desired.
     */
    function _recover(address account, uint256 tokenId) internal virtual returns (uint256) {
        address owner = underlying().ownerOf(tokenId);
        if (owner != address(this)) {
            revert ERC721IncorrectOwner(address(this), tokenId, owner);
        }
        _safeMint(account, tokenId);
        return tokenId;
    }

    /**
     * @dev Returns the underlying token.
     */
    function underlying() public view virtual returns (IERC721) {
        ERC721WrapperStorage storage $ = _getERC721WrapperStorage();
        return $._underlying;
    }
}
