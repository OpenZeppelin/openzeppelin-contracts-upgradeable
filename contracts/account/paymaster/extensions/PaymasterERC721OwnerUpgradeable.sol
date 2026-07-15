// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.7.0-rc.0) (account/paymaster/extensions/PaymasterERC721Owner.sol)

pragma solidity ^0.8.20;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {ERC4337Utils} from "@openzeppelin/contracts/account/utils/ERC4337Utils.sol";
import {PackedUserOperation} from "@openzeppelin/contracts/interfaces/IERC4337.sol";
import {PaymasterUpgradeable} from "../PaymasterUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Extension of {Paymaster} that supports account based on ownership of an ERC-721 token.
 *
 * This paymaster will sponsor user operations if the user has at least 1 token of the token specified
 * during construction.
 *
 * NOTE: {_validatePaymasterUserOp} reads `token.balanceOf` during the validation phase, accessing storage in
 * an external contract. ERC-7562 restricts unstaked paymasters from such accesses, and public mempool bundlers
 * will reject these operations when the token contract is proxied or upgradeable. Stake the paymaster
 * (see {Paymaster-_addStake}) when deploying against a public mempool.
 */
abstract contract PaymasterERC721OwnerUpgradeable is Initializable, PaymasterUpgradeable {
    /// @custom:storage-location erc7201:openzeppelin.storage.PaymasterERC721Owner
    struct PaymasterERC721OwnerStorage {
        IERC721 _token;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.PaymasterERC721Owner")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant PaymasterERC721OwnerStorageLocation = 0x2078a559a55e87b4245d959573dfb2de21109f0742c621716c6389c40b39b200;

    function _getPaymasterERC721OwnerStorage() private pure returns (PaymasterERC721OwnerStorage storage $) {
        assembly {
            $.slot := PaymasterERC721OwnerStorageLocation
        }
    }

    function __PaymasterERC721Owner_init(IERC721 token_) internal onlyInitializing {
        __PaymasterERC721Owner_init_unchained(token_);
    }

    function __PaymasterERC721Owner_init_unchained(IERC721 token_) internal onlyInitializing {
        PaymasterERC721OwnerStorage storage $ = _getPaymasterERC721OwnerStorage();
        $._token = token_;
    }

    /// @dev ERC-721 token used to validate the user operation.
    function token() public virtual returns (IERC721) {
        PaymasterERC721OwnerStorage storage $ = _getPaymasterERC721OwnerStorage();
        return $._token;
    }

    /**
     * @dev Internal validation of whether the paymaster is willing to pay for the user operation.
     * Returns the context to be passed to postOp and the validation data.
     *
     * NOTE: The default `context` is `bytes(0)`. Developers that add a context when overriding this function MUST
     * also override {_postOp} to process the context passed along.
     */
    function _validatePaymasterUserOp(
        PackedUserOperation calldata userOp,
        bytes32 /* userOpHash */,
        uint256 /* maxCost */
    ) internal virtual override returns (bytes memory context, uint256 validationData) {
        return (
            bytes(""),
            // balanceOf reverts if the `userOp.sender` is the address(0), so this becomes unreachable with address(0)
            // assuming a compliant entrypoint (`_validatePaymasterUserOp` is called after `validateUserOp`),
            token().balanceOf(userOp.sender) == 0
                ? ERC4337Utils.SIG_VALIDATION_FAILED
                : ERC4337Utils.SIG_VALIDATION_SUCCESS
        );
    }
}
