// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {BridgeERC20CoreUpgradeable} from "./BridgeERC20CoreUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * @dev This is a variant of {BridgeERC20Core} that implements the bridge logic for ERC-20 tokens that do not expose a
 * crosschain mint and burn mechanism. Instead, it takes custody of bridged assets.
 */
// slither-disable-next-line locked-ether
abstract contract BridgeERC20Upgradeable is Initializable, BridgeERC20CoreUpgradeable {
    using SafeERC20 for IERC20;

    /// @custom:storage-location erc7201:openzeppelin.storage.BridgeERC20
    struct BridgeERC20Storage {
        IERC20 _token;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.BridgeERC20")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant BridgeERC20StorageLocation = 0x244b01c12a07f59148f0f6492b0cb67864481add66b2bb58fc6fb6ea2a07f700;

    function _getBridgeERC20Storage() private pure returns (BridgeERC20Storage storage $) {
        assembly {
            $.slot := BridgeERC20StorageLocation
        }
    }

    function __BridgeERC20_init(IERC20 token_) internal onlyInitializing {
        __BridgeERC20_init_unchained(token_);
    }

    function __BridgeERC20_init_unchained(IERC20 token_) internal onlyInitializing {
        BridgeERC20Storage storage $ = _getBridgeERC20Storage();
        $._token = token_;
    }

    /// @dev Return the address of the ERC20 token this bridge operates on.
    function token() public view virtual returns (IERC20) {
        BridgeERC20Storage storage $ = _getBridgeERC20Storage();
        return $._token;
    }

    /// @dev "Locking" tokens is done by taking custody
    function _onSend(address from, uint256 amount) internal virtual override {
        token().safeTransferFrom(from, address(this), amount);
    }

    /// @dev "Unlocking" tokens is done by releasing custody
    function _onReceive(address to, uint256 amount) internal virtual override {
        token().safeTransfer(to, amount);
    }
}
