// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../token/ERC721/extensions/ERC721BurnableUpgradeable.sol";
import "../token/ERC721/extensions/ERC721ConsecutiveUpgradeable.sol";
import "../token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";
import "../token/ERC721/extensions/ERC721PausableUpgradeable.sol";
import "../token/ERC721/extensions/ERC721VotesUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

/**
 * @title ERC721ConsecutiveMock
 */
contract ERC721ConsecutiveMockUpgradeable is Initializable, ERC721BurnableUpgradeable, ERC721ConsecutiveUpgradeable, ERC721PausableUpgradeable, ERC721VotesUpgradeable {
    function __ERC721ConsecutiveMock_init(
        string memory name,
        string memory symbol,
        address[] memory delegates,
        address[] memory receivers,
        uint96[] memory amounts
    ) internal onlyInitializing {
        __ERC721_init_unchained(name, symbol);
        __Pausable_init_unchained();
        __EIP712_init_unchained(name, "1");
        __ERC721ConsecutiveMock_init_unchained(name, symbol, delegates, receivers, amounts);
    }

    function __ERC721ConsecutiveMock_init_unchained(
        string memory,
        string memory,
        address[] memory delegates,
        address[] memory receivers,
        uint96[] memory amounts
    ) internal onlyInitializing {
        for (uint256 i = 0; i < delegates.length; ++i) {
            _delegate(delegates[i], delegates[i]);
        }

        for (uint256 i = 0; i < receivers.length; ++i) {
            _mintConsecutive(receivers[i], amounts[i]);
        }
    }

    function pause() external {
        _pause();
    }

    function unpause() external {
        _unpause();
    }

    function exists(uint256 tokenId) public view returns (bool) {
        return _exists(tokenId);
    }

    function mint(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }

    function mintConsecutive(address to, uint96 amount) public {
        _mintConsecutive(to, amount);
    }

    function safeMint(address to, uint256 tokenId) public {
        _safeMint(to, tokenId);
    }

    function _ownerOf(uint256 tokenId) internal view virtual override(ERC721Upgradeable, ERC721ConsecutiveUpgradeable) returns (address) {
        return super._ownerOf(tokenId);
    }

    function _mint(address to, uint256 tokenId) internal virtual override(ERC721Upgradeable, ERC721ConsecutiveUpgradeable) {
        super._mint(to, tokenId);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 firstTokenId,
        uint256 batchSize
    ) internal virtual override(ERC721Upgradeable, ERC721PausableUpgradeable) {
        super._beforeTokenTransfer(from, to, firstTokenId, batchSize);
    }

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 firstTokenId,
        uint256 batchSize
    ) internal virtual override(ERC721Upgradeable, ERC721VotesUpgradeable, ERC721ConsecutiveUpgradeable) {
        super._afterTokenTransfer(from, to, firstTokenId, batchSize);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}

contract ERC721ConsecutiveNoConstructorMintMockUpgradeable is Initializable, ERC721ConsecutiveUpgradeable {
    function __ERC721ConsecutiveNoConstructorMintMock_init(string memory name, string memory symbol) internal onlyInitializing {
        __ERC721_init_unchained(name, symbol);
        __ERC721ConsecutiveNoConstructorMintMock_init_unchained(name, symbol);
    }

    function __ERC721ConsecutiveNoConstructorMintMock_init_unchained(string memory, string memory) internal onlyInitializing {
        _mint(msg.sender, 0);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
