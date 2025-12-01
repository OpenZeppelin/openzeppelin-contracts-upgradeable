// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {IERC7802} from "@openzeppelin/contracts/interfaces/draft-IERC7802.sol";
import {BridgeERC20CoreUpgradeable} from "./BridgeERC20CoreUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * @dev This is a variant of {BridgeERC20Core} that implements the bridge logic for ERC-7802 compliant tokens.
 */
// slither-disable-next-line locked-ether
abstract contract BridgeERC7802Upgradeable is Initializable, BridgeERC20CoreUpgradeable {
    /// @custom:storage-location erc7201:openzeppelin.storage.BridgeERC7802
    struct BridgeERC7802Storage {
        IERC7802 _token;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.BridgeERC7802")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant BridgeERC7802StorageLocation = 0xaa74a536d5c1ef957e103c5cd74a2d097ce13b7e0a555173bee99ce500fd4300;

    function _getBridgeERC7802Storage() private pure returns (BridgeERC7802Storage storage $) {
        assembly {
            $.slot := BridgeERC7802StorageLocation
        }
    }

    function __BridgeERC7802_init(IERC7802 token_) internal onlyInitializing {
        __BridgeERC7802_init_unchained(token_);
    }

    function __BridgeERC7802_init_unchained(IERC7802 token_) internal onlyInitializing {
        BridgeERC7802Storage storage $ = _getBridgeERC7802Storage();
        $._token = token_;
    }

    /// @dev Return the address of the ERC20 token this bridge operates on.
    function token() public view virtual returns (IERC7802) {
        BridgeERC7802Storage storage $ = _getBridgeERC7802Storage();
        return $._token;
    }

    /// @dev "Locking" tokens using an ERC-7802 crosschain burn
    function _onSend(address from, uint256 amount) internal virtual override {
        token().crosschainBurn(from, amount);
    }

    /// @dev "Unlocking" tokens using an ERC-7802 crosschain mint
    function _onReceive(address to, uint256 amount) internal virtual override {
        token().crosschainMint(to, amount);
    }
}
