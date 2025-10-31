// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.5.0) (token/ERC6909/extensions/ERC6909TokenSupply.sol)

pragma solidity ^0.8.20;

import {ERC6909Upgradeable} from "../ERC6909Upgradeable.sol";
import {IERC6909TokenSupply} from "@openzeppelin/contracts/interfaces/IERC6909.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Implementation of the Token Supply extension defined in ERC6909.
 * Tracks the total supply of each token id individually.
 */
contract ERC6909TokenSupplyUpgradeable is Initializable, ERC6909Upgradeable, IERC6909TokenSupply {
    /// @custom:storage-location erc7201:openzeppelin.storage.ERC6909TokenSupply
    struct ERC6909TokenSupplyStorage {
        mapping(uint256 id => uint256) _totalSupplies;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.ERC6909TokenSupply")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant ERC6909TokenSupplyStorageLocation = 0x9cc5ac148333cfaf4365d2d67a9c6e8fab8e8f4df7b569f769d68102db719600;

    function _getERC6909TokenSupplyStorage() private pure returns (ERC6909TokenSupplyStorage storage $) {
        assembly {
            $.slot := ERC6909TokenSupplyStorageLocation
        }
    }

    function __ERC6909TokenSupply_init() internal onlyInitializing {
    }

    function __ERC6909TokenSupply_init_unchained() internal onlyInitializing {
    }
    /// @inheritdoc IERC6909TokenSupply
    function totalSupply(uint256 id) public view virtual override returns (uint256) {
        ERC6909TokenSupplyStorage storage $ = _getERC6909TokenSupplyStorage();
        return $._totalSupplies[id];
    }

    /// @dev Override the `_update` function to update the total supply of each token id as necessary.
    function _update(address from, address to, uint256 id, uint256 amount) internal virtual override {
        ERC6909TokenSupplyStorage storage $ = _getERC6909TokenSupplyStorage();
        super._update(from, to, id, amount);

        if (from == address(0)) {
            $._totalSupplies[id] += amount;
        }
        if (to == address(0)) {
            unchecked {
                // amount <= _balances[from][id] <= _totalSupplies[id]
                $._totalSupplies[id] -= amount;
            }
        }
    }
}
