// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {ERC4337Utils} from "@openzeppelin/contracts/account/utils/ERC4337Utils.sol";
import {PackedUserOperation} from "@openzeppelin/contracts/interfaces/IERC4337.sol";
import {AbstractSigner} from "@openzeppelin/contracts/utils/cryptography/signers/AbstractSigner.sol";
import {EIP712Upgradeable} from "../../../utils/cryptography/EIP712Upgradeable.sol";
import {PaymasterUpgradeable} from "../PaymasterUpgradeable.sol";
import {Calldata} from "@openzeppelin/contracts/utils/Calldata.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * @dev Extension of {Paymaster} that adds signature validation. See {SignerECDSA}, {SignerP256} or {SignerRSA}.
 *
 * Example of usage:
 *
 * ```solidity
 * contract MyPaymasterECDSASigner is PaymasterSigner, SignerECDSA {
 *     constructor(address signerAddr) EIP712("MyPaymasterECDSASigner", "1") SignerECDSA(signerAddr) {}
 * }
 * ```
 */
abstract contract PaymasterSignerUpgradeable is Initializable, AbstractSigner, EIP712Upgradeable, PaymasterUpgradeable {
    using ERC4337Utils for *;

    bytes32 private constant USER_OPERATION_REQUEST_TYPEHASH =
        keccak256(
            "UserOperationRequest(address sender,uint256 nonce,bytes initCode,bytes callData,bytes32 accountGasLimits,uint256 preVerificationGas,bytes32 gasFees,uint256 paymasterVerificationGasLimit,uint256 paymasterPostOpGasLimit,uint48 validAfter,uint48 validUntil)"
        );

    function __PaymasterSigner_init() internal onlyInitializing {
    }

    function __PaymasterSigner_init_unchained() internal onlyInitializing {
    }
    /**
     * @dev Virtual function that returns the signable hash for a user operations. Given the `userOpHash`
     * contains the `paymasterAndData` itself, it's not possible to sign that value directly. Instead,
     * this function must be used to provide a custom mechanism to authorize an user operation.
     */
    function _signableUserOpHash(
        PackedUserOperation calldata userOp,
        uint48 validAfter,
        uint48 validUntil
    ) internal view virtual returns (bytes32) {
        return
            _hashTypedDataV4(
                keccak256(
                    abi.encode(
                        USER_OPERATION_REQUEST_TYPEHASH,
                        userOp.sender,
                        userOp.nonce,
                        keccak256(userOp.initCode),
                        keccak256(userOp.callData),
                        userOp.accountGasLimits,
                        userOp.preVerificationGas,
                        userOp.gasFees,
                        userOp.paymasterVerificationGasLimit(),
                        userOp.paymasterPostOpGasLimit(),
                        validAfter,
                        validUntil
                    )
                )
            );
    }

    /**
     * @dev Internal validation of whether the paymaster is willing to pay for the user operation.
     * Returns the context to be passed to postOp and the validation data.
     *
     * NOTE: The `context` returned is `bytes(0)`. Developers overriding this function MUST
     * override {_postOp} to process the context passed along.
     */
    function _validatePaymasterUserOp(
        PackedUserOperation calldata userOp,
        bytes32 /* userOpHash */,
        uint256 /* maxCost */
    ) internal virtual override returns (bytes memory context, uint256 validationData) {
        (uint48 validAfter, uint48 validUntil, bytes calldata signature) = _decodePaymasterUserOp(userOp);

        // Mixed `BLOCK_RANGE_FLAG` bits between `validAfter` and `validUntil` are rejected
        bool rangeFlagsCompatible = (validAfter ^ validUntil) & ERC4337Utils.BLOCK_RANGE_FLAG == 0;

        return (
            bytes(""),
            rangeFlagsCompatible
                ? _rawSignatureValidation(_signableUserOpHash(userOp, validAfter, validUntil), signature)
                    .packValidationData(validAfter, validUntil)
                : ERC4337Utils.SIG_VALIDATION_FAILED
        );
    }

    /// @dev Decodes the user operation's data from `paymasterAndData`.
    function _decodePaymasterUserOp(
        PackedUserOperation calldata userOp
    ) internal pure virtual returns (uint48 validAfter, uint48 validUntil, bytes calldata signature) {
        bytes calldata paymasterData = userOp.paymasterData();
        return
            paymasterData.length < 12
                ? (uint48(0), uint48(0), Calldata.emptyBytes())
                : (uint48(bytes6(paymasterData[0:6])), uint48(bytes6(paymasterData[6:12])), paymasterData[12:]);
    }
}
