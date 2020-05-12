pragma solidity ^0.6.0;

import "../token/ERC721/ERC721.sol";
import "../GSN/GSNRecipient.sol";
import "../GSN/GSNRecipientSignature.sol";
import "../Initializable.sol";

/**
 * @title ERC721GSNRecipientMock
 * A simple ERC721 mock that has GSN support enabled
 */
contract ERC721GSNRecipientMockUpgradeable is Initializable, ERC721Upgradeable, GSNRecipientUpgradeable, GSNRecipientSignatureUpgradeable {

    constructor(string memory name, string memory symbol, address trustedSigner) public  {
        __ERC721GSNRecipientMock_init(name, symbol, trustedSigner);
    }

    function __ERC721GSNRecipientMock_init(string memory name, string memory symbol, address trustedSigner) internal initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __ERC721_init_unchained(name, symbol);
        __GSNRecipient_init_unchained();
        __GSNRecipientSignature_init_unchained(trustedSigner);
        __ERC721GSNRecipientMock_init_unchained(name, symbol, trustedSigner);
    }

    function __ERC721GSNRecipientMock_init_unchained(string memory name, string memory symbol, address trustedSigner) internal initializer {


    }


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
