// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (utils/cryptography/signers/SignerECDSA.sol)

pragma solidity ^0.8.20;

import {AbstractSigner} from "@openzeppelin/contracts/utils/cryptography/signers/AbstractSigner.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Implementation of {AbstractSigner} using xref:api:utils/cryptography#ECDSA[ECDSA] signatures.
 *
 * For {Account} usage, a {_setSigner} function is provided to set the {signer} address.
 * Doing so is easier for a factory, who is likely to use initializable clones of this contract.
 *
 * Example of usage:
 *
 * ```solidity
 * contract MyAccountECDSA is Account, SignerECDSA, Initializable {
 *     function initialize(address signerAddr) public initializer {
 *       _setSigner(signerAddr);
 *     }
 * }
 * ```
 *
 * IMPORTANT: Failing to call {_setSigner} either during construction (if used standalone)
 * or during initialization (if used as a clone) may leave the signer either front-runnable or unusable.
 */
abstract contract SignerECDSAUpgradeable is Initializable, AbstractSigner {
    /// @custom:storage-location erc7201:openzeppelin.storage.SignerECDSA
    struct SignerECDSAStorage {
        address _signer;
    }

    // keccak256(abi.encode(uint256(keccak256("openzeppelin.storage.SignerECDSA")) - 1)) & ~bytes32(uint256(0xff))
    bytes32 private constant SignerECDSAStorageLocation = 0x21a2a8bb424898f7a6033d112ec6057811f27c903c45eccf7ad7cefcbbc0d200;

    function _getSignerECDSAStorage() private pure returns (SignerECDSAStorage storage $) {
        assembly {
            $.slot := SignerECDSAStorageLocation
        }
    }

    function __SignerECDSA_init(address signerAddr) internal onlyInitializing {
        __SignerECDSA_init_unchained(signerAddr);
    }

    function __SignerECDSA_init_unchained(address signerAddr) internal onlyInitializing {
        _setSigner(signerAddr);
    }

    /**
     * @dev Sets the signer with the address of the native signer. This function should be called during construction
     * or through an initializer.
     */
    function _setSigner(address signerAddr) internal {
        SignerECDSAStorage storage $ = _getSignerECDSAStorage();
        $._signer = signerAddr;
    }

    /// @dev Return the signer's address.
    function signer() public view virtual returns (address) {
        SignerECDSAStorage storage $ = _getSignerECDSAStorage();
        return $._signer;
    }

    /// @inheritdoc AbstractSigner
    function _rawSignatureValidation(
        bytes32 hash,
        bytes calldata signature
    ) internal view virtual override returns (bool) {
        (address recovered, ECDSA.RecoverError err, ) = ECDSA.tryRecoverCalldata(hash, signature);
        return signer() == recovered && err == ECDSA.RecoverError.NoError;
    }
}
