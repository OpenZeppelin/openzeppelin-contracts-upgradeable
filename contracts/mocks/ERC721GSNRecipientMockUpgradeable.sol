// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../token/ERC721/ERC721Upgradeable.sol";
import "../GSN/GSNRecipientUpgradeable.sol";
import "../GSN/GSNRecipientSignatureUpgradeable.sol";
import "../proxy/Initializable.sol";

/**
 * @title ERC721GSNRecipientMock
 * A simple ERC721 mock that has GSN support enabled
 */
contract ERC721GSNRecipientMockUpgradeable is Initializable, ERC721Upgradeable, GSNRecipientUpgradeable, GSNRecipientSignatureUpgradeable {
    function __ERC721GSNRecipientMock_init(string memory name, string memory symbol, address trustedSigner) internal initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __ERC721_init_unchained(name, symbol);
        __GSNRecipient_init_unchained();
        __GSNRecipientSignature_init_unchained(trustedSigner);
        __ERC721GSNRecipientMock_init_unchained(name, symbol, trustedSigner);
    }

    function __ERC721GSNRecipientMock_init_unchained(string memory name, string memory symbol, address trustedSigner) internal initializer { }

    function mint(uint256 tokenId) public {
        _mint(_msgSender(), tokenId);
    }

    function _msgSender() internal view override(ContextUpgradeable, GSNRecipientUpgradeable) returns (address payable) {
        return GSNRecipientUpgradeable._msgSender();
    }

    function _msgData() internal view override(ContextUpgradeable, GSNRecipientUpgradeable) returns (bytes memory) {
        return GSNRecipientUpgradeable._msgData();
    }
    uint256[50] private __gap;
}
