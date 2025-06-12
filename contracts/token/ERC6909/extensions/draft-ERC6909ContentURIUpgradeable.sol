// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.3.0) (token/ERC6909/extensions/draft-ERC6909ContentURI.sol)

pragma solidity ^0.8.20;

import {ERC6909Upgradeable} from "../draft-ERC6909Upgradeable.sol";
import {IERC6909ContentURI} from "@openzeppelin/contracts/interfaces/draft-IERC6909.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev Implementation of the Content URI extension defined in ERC6909.
 */
contract ERC6909ContentURIUpgradeable is Initializable, ERC6909Upgradeable, IERC6909ContentURI {
    /// @custom:storage-location erc7201:openzeppelin.storage.ERC6909ContentURI
    struct ERC6909ContentURIStorage {
        string _contractURI;
        mapping(uint256 id => string) _tokenURIs;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.ERC6909ContentURI")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ERC6909ContentURIStorageLocation = 0x2ada2772a8c4d40c4be8741992e423a9f97d5f4ef76852e5c17a40aa7fb9e500;

    function _getERC6909ContentURIStorage() private pure returns (ERC6909ContentURIStorage storage $) {
        assembly {
            $.slot := ERC6909ContentURIStorageLocation
        }
    }

    /// @dev Event emitted when the contract URI is changed. See https://eips.ethereum.org/EIPS/eip-7572[ERC-7572] for details.
    event ContractURIUpdated();

    /// @dev See {IERC1155-URI}
    event URI(string value, uint256 indexed id);

    function __ERC6909ContentURI_init() internal onlyInitializing {
    }

    function __ERC6909ContentURI_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc IERC6909ContentURI
    function contractURI() public view virtual override returns (string memory) {
        ERC6909ContentURIStorage storage $ = _getERC6909ContentURIStorage();
        return $._contractURI;
    }

    /// @inheritdoc IERC6909ContentURI
    function tokenURI(uint256 id) public view virtual override returns (string memory) {
        ERC6909ContentURIStorage storage $ = _getERC6909ContentURIStorage();
        return $._tokenURIs[id];
    }

    /**
     * @dev Sets the {contractURI} for the contract.
     *
     * Emits a {ContractURIUpdated} event.
     */
    function _setContractURI(string memory newContractURI) internal virtual {
        ERC6909ContentURIStorage storage $ = _getERC6909ContentURIStorage();
        $._contractURI = newContractURI;

        emit ContractURIUpdated();
    }

    /**
     * @dev Sets the {tokenURI} for a given token of type `id`.
     *
     * Emits a {URI} event.
     */
    function _setTokenURI(uint256 id, string memory newTokenURI) internal virtual {
        ERC6909ContentURIStorage storage $ = _getERC6909ContentURIStorage();
        $._tokenURIs[id] = newTokenURI;

        emit URI(newTokenURI, id);
    }
}
