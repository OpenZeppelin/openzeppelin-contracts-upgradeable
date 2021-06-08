// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ECDSAUpgradeable.sol";
import "../AddressUpgradeable.sol";
import "../../interfaces/IERC1271Upgradeable.sol";

/**
 * @dev Signature verification helper: Provide a single mechanism to verify both private-key (EOA) ECDSA signature and
 * ERC1271 contract sigantures. Using this instead of ECDSA.recover in your contract will make them compatible with
 * smart contract wallets such as Argent and Gnosis.
 *
 * Note: unlike ECDSA signatures, contract signature's are revocable, and the outcome of this function can thus change
 * through time. It could return true at block N and false at block N+1 (or the opposite).
 *
 * _Available since v4.1._
 */
library SignatureCheckerUpgradeable {
    function isValidSignatureNow(
        address signer,
        bytes32 hash,
        bytes memory signature
    ) internal view returns (bool) {
        if (AddressUpgradeable.isContract(signer)) {
            try IERC1271Upgradeable(signer).isValidSignature(hash, signature) returns (bytes4 magicValue) {
                return magicValue == IERC1271Upgradeable(signer).isValidSignature.selector;
            } catch {
                return false;
            }
        } else {
            return ECDSAUpgradeable.recover(hash, signature) == signer;
        }
    }
}
