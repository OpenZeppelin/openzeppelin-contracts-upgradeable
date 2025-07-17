// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (utils/cryptography/signers/SignerP256.sol)

pragma solidity ^0.8.20;

import {AbstractSigner} from "@openzeppelin/contracts/utils/cryptography/signers/AbstractSigner.sol";
import {P256} from "@openzeppelin/contracts/utils/cryptography/P256.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev Implementation of {AbstractSigner} using xref:api:utils/cryptography#P256[P256] signatures.
 *
 * For {Account} usage, a {_setSigner} function is provided to set the {signer} public key.
 * Doing so is easier for a factory, who is likely to use initializable clones of this contract.
 *
 * Example of usage:
 *
 * ```solidity
 * contract MyAccountP256 is Account, SignerP256, Initializable {
 *     function initialize(bytes32 qx, bytes32 qy) public initializer {
 *       _setSigner(qx, qy);
 *     }
 * }
 * ```
 *
 * IMPORTANT: Failing to call {_setSigner} either during construction (if used standalone)
 * or during initialization (if used as a clone) may leave the signer either front-runnable or unusable.
 */
abstract contract SignerP256Upgradeable is Initializable, AbstractSigner {
    /// @custom:storage-location erc7201:openzeppelin.storage.SignerP256
    struct SignerP256Storage {
        bytes32 _qx;
        bytes32 _qy;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.SignerP256")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SignerP256StorageLocation = 0x6c6e681eb9c9937bb0e9a845af882a34f03801b1b670c4e5431f8b41c16a2700;

    function _getSignerP256Storage() private pure returns (SignerP256Storage storage $) {
        assembly {
            $.slot := SignerP256StorageLocation
        }
    }

    error SignerP256InvalidPublicKey(bytes32 qx, bytes32 qy);

    function __SignerP256_init(bytes32 qx, bytes32 qy) internal onlyInitializing {
        __SignerP256_init_unchained(qx, qy);
    }

    function __SignerP256_init_unchained(bytes32 qx, bytes32 qy) internal onlyInitializing {
        _setSigner(qx, qy);
    }

    /**
     * @dev Sets the signer with a P256 public key. This function should be called during construction
     * or through an initializer.
     */
    function _setSigner(bytes32 qx, bytes32 qy) internal {
        SignerP256Storage storage $ = _getSignerP256Storage();
        if (!P256.isValidPublicKey(qx, qy)) revert SignerP256InvalidPublicKey(qx, qy);
        $._qx = qx;
        $._qy = qy;
    }

    /// @dev Return the signer's P256 public key.
    function signer() public view virtual returns (bytes32 qx, bytes32 qy) {
        SignerP256Storage storage $ = _getSignerP256Storage();
        return ($._qx, $._qy);
    }

    /// @inheritdoc AbstractSigner
    function _rawSignatureValidation(
        bytes32 hash,
        bytes calldata signature
    ) internal view virtual override returns (bool) {
        if (signature.length < 0x40) return false;
        bytes32 r = bytes32(signature[0x00:0x20]);
        bytes32 s = bytes32(signature[0x20:0x40]);
        (bytes32 qx, bytes32 qy) = signer();
        return P256.verify(hash, r, s, qx, qy);
    }
}
