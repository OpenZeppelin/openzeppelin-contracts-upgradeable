// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../token/ERC721/ERC721UpgradeSafe.sol";
import "../GSN/GSNRecipientUpgradeSafe.sol";
import "../GSN/GSNRecipientSignatureUpgradeSafe.sol";
import "../Initializable.sol";

/**
 * @title ERC721GSNRecipientMock
 * A simple ERC721 mock that has GSN support enabled
 */
contract ERC721GSNRecipientMockUpgradeSafe is __Initializable, ERC721UpgradeSafe, GSNRecipientUpgradeSafe, GSNRecipientSignatureUpgradeSafe {
    function __ERC721GSNRecipientMock_init(string memory name, string memory symbol, address trustedSigner) internal __initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __ERC721_init_unchained(name, symbol);
        __GSNRecipient_init_unchained();
        __GSNRecipientSignature_init_unchained(trustedSigner);
        __ERC721GSNRecipientMock_init_unchained(name, symbol, trustedSigner);
    }

    function __ERC721GSNRecipientMock_init_unchained(string memory name, string memory symbol, address trustedSigner) internal __initializer { }

    function mint(uint256 tokenId) public {
        _mint(_msgSender(), tokenId);
    }

    function _msgSender() internal view override(ContextUpgradeSafe, GSNRecipientUpgradeSafe) returns (address payable) {
        return GSNRecipientUpgradeSafe._msgSender();
    }

    function _msgData() internal view override(ContextUpgradeSafe, GSNRecipientUpgradeSafe) returns (bytes memory) {
        return GSNRecipientUpgradeSafe._msgData();
    }
    uint256[50] private __gap;
}
