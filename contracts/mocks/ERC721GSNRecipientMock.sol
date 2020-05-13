pragma solidity ^0.6.0;

import "../token/ERC721/ERC721.sol";
import "../GSN/GSNRecipient.sol";
import "../GSN/GSNRecipientSignature.sol";
import "../Initializable.sol";

/**
 * @title ERC721GSNRecipientMock
 * A simple ERC721 mock that has GSN support enabled
 */
contract ERC721GSNRecipientMockUpgradeSafe is Initializable, ERC721UpgradeSafe, GSNRecipientUpgradeSafe, GSNRecipientSignatureUpgradeSafe {

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

    function _msgSender() internal view override(ContextUpgradeSafe, GSNRecipientUpgradeSafe) returns (address payable) {
        return GSNRecipientUpgradeSafe._msgSender();
    }

    function _msgData() internal view override(ContextUpgradeSafe, GSNRecipientUpgradeSafe) returns (bytes memory) {
        return GSNRecipientUpgradeSafe._msgData();
    }

    uint256[50] private __gap;
}
