// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.5.0) (token/ERC6909/extensions/ERC6909Metadata.sol)

pragma solidity ^0.8.20;

import {ERC6909Upgradeable} from "../ERC6909Upgradeable.sol";
import {IERC6909Metadata} from "@openzeppelin/contracts/interfaces/IERC6909.sol";
import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Implementation of the Metadata extension defined in ERC6909. Exposes the name, symbol, and decimals of each token id.
 */
contract ERC6909MetadataUpgradeable is Initializable, ERC6909Upgradeable, IERC6909Metadata {
    struct TokenMetadata {
        string name;
        string symbol;
        uint8 decimals;
    }

    /// @custom:storage-location erc7201:openzeppelin.storage.ERC6909Metadata
    struct ERC6909MetadataStorage {
        mapping(uint256 id => TokenMetadata) _tokenMetadata;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.ERC6909Metadata")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ERC6909MetadataStorageLocation = 0xa0651e3d105d335a33d7d04897e080112be09c416f44637d6543e5b47885f800;

    function _getERC6909MetadataStorage() private pure returns (ERC6909MetadataStorage storage $) {
        assembly {
            $.slot := ERC6909MetadataStorageLocation
        }
    }

    /// @dev The name of the token of type `id` was updated to `newName`.
    event ERC6909NameUpdated(uint256 indexed id, string newName);

    /// @dev The symbol for the token of type `id` was updated to `newSymbol`.
    event ERC6909SymbolUpdated(uint256 indexed id, string newSymbol);

    /// @dev The decimals value for token of type `id` was updated to `newDecimals`.
    event ERC6909DecimalsUpdated(uint256 indexed id, uint8 newDecimals);

    function __ERC6909Metadata_init() internal onlyInitializing {
    }

    function __ERC6909Metadata_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc IERC6909Metadata
    function name(uint256 id) public view virtual override returns (string memory) {
        ERC6909MetadataStorage storage $ = _getERC6909MetadataStorage();
        return $._tokenMetadata[id].name;
    }

    /// @inheritdoc IERC6909Metadata
    function symbol(uint256 id) public view virtual override returns (string memory) {
        ERC6909MetadataStorage storage $ = _getERC6909MetadataStorage();
        return $._tokenMetadata[id].symbol;
    }

    /// @inheritdoc IERC6909Metadata
    function decimals(uint256 id) public view virtual override returns (uint8) {
        ERC6909MetadataStorage storage $ = _getERC6909MetadataStorage();
        return $._tokenMetadata[id].decimals;
    }

    /// @inheritdoc IERC165
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC6909Upgradeable, IERC165) returns (bool) {
        return interfaceId == type(IERC6909Metadata).interfaceId || super.supportsInterface(interfaceId);
    }

    /**
     * @dev Sets the `name` for a given token of type `id`.
     *
     * Emits an {ERC6909NameUpdated} event.
     */
    function _setName(uint256 id, string memory newName) internal virtual {
        ERC6909MetadataStorage storage $ = _getERC6909MetadataStorage();
        $._tokenMetadata[id].name = newName;

        emit ERC6909NameUpdated(id, newName);
    }

    /**
     * @dev Sets the `symbol` for a given token of type `id`.
     *
     * Emits an {ERC6909SymbolUpdated} event.
     */
    function _setSymbol(uint256 id, string memory newSymbol) internal virtual {
        ERC6909MetadataStorage storage $ = _getERC6909MetadataStorage();
        $._tokenMetadata[id].symbol = newSymbol;

        emit ERC6909SymbolUpdated(id, newSymbol);
    }

    /**
     * @dev Sets the `decimals` for a given token of type `id`.
     *
     * Emits an {ERC6909DecimalsUpdated} event.
     */
    function _setDecimals(uint256 id, uint8 newDecimals) internal virtual {
        ERC6909MetadataStorage storage $ = _getERC6909MetadataStorage();
        $._tokenMetadata[id].decimals = newDecimals;

        emit ERC6909DecimalsUpdated(id, newDecimals);
    }
}
