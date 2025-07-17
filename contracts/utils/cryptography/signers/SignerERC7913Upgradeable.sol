// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (utils/cryptography/signers/SignerERC7913.sol)

pragma solidity ^0.8.24;

import {AbstractSigner} from "@openzeppelin/contracts/utils/cryptography/signers/AbstractSigner.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

/**
 * @dev Implementation of {AbstractSigner} using
 * https://eips.ethereum.org/EIPS/eip-7913[ERC-7913] signature verification.
 *
 * For {Account} usage, a {_setSigner} function is provided to set the ERC-7913 formatted {signer}.
 * Doing so is easier for a factory, who is likely to use initializable clones of this contract.
 *
 * The signer is a `bytes` object that concatenates a verifier address and a key: `verifier || key`.
 *
 * Example of usage:
 *
 * ```solidity
 * contract MyAccountERC7913 is Account, SignerERC7913, Initializable {
 *     function initialize(bytes memory signer_) public initializer {
 *       _setSigner(signer_);
 *     }
 *
 *     function setSigner(bytes memory signer_) public onlyEntryPointOrSelf {
 *       _setSigner(signer_);
 *     }
 * }
 * ```
 *
 * IMPORTANT: Failing to call {_setSigner} either during construction (if used standalone)
 * or during initialization (if used as a clone) may leave the signer either front-runnable or unusable.
 */

abstract contract SignerERC7913Upgradeable is Initializable, AbstractSigner {
    /// @custom:storage-location erc7201:openzeppelin.storage.SignerERC7913
    struct SignerERC7913Storage {
        bytes _signer;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.SignerERC7913")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SignerERC7913StorageLocation = 0x170786af7cf7b78916dca5a937f25e3b9b70ae3faee6f0db68cda91b7e818e00;

    function _getSignerERC7913Storage() private pure returns (SignerERC7913Storage storage $) {
        assembly {
            $.slot := SignerERC7913StorageLocation
        }
    }

    function __SignerERC7913_init(bytes memory signer_) internal onlyInitializing {
        __SignerERC7913_init_unchained(signer_);
    }

    function __SignerERC7913_init_unchained(bytes memory signer_) internal onlyInitializing {
        _setSigner(signer_);
    }

    /// @dev Return the ERC-7913 signer (i.e. `verifier || key`).
    function signer() public view virtual returns (bytes memory) {
        SignerERC7913Storage storage $ = _getSignerERC7913Storage();
        return $._signer;
    }

    /// @dev Sets the signer (i.e. `verifier || key`) with an ERC-7913 formatted signer.
    function _setSigner(bytes memory signer_) internal {
        SignerERC7913Storage storage $ = _getSignerERC7913Storage();
        $._signer = signer_;
    }

    /**
     * @dev Verifies a signature using {SignatureChecker-isValidSignatureNow-bytes-bytes32-bytes-}
     * with {signer}, `hash` and `signature`.
     */
    function _rawSignatureValidation(
        bytes32 hash,
        bytes calldata signature
    ) internal view virtual override returns (bool) {
        return SignatureChecker.isValidSignatureNow(signer(), hash, signature);
    }
}
