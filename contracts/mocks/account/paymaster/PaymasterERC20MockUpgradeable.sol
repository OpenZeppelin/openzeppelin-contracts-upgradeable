// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {AccessControlUpgradeable} from "../../../access/AccessControlUpgradeable.sol";
import {ERC4337Utils} from "@openzeppelin/contracts/account/utils/ERC4337Utils.sol";
import {PackedUserOperation} from "@openzeppelin/contracts/interfaces/IERC4337.sol";
import {EIP712Upgradeable} from "../../../utils/cryptography/EIP712Upgradeable.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";
import {PaymasterERC20Upgradeable} from "../../../account/paymaster/extensions/PaymasterERC20Upgradeable.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {PaymasterERC20GuarantorUpgradeable} from "../../../account/paymaster/extensions/PaymasterERC20GuarantorUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

/**
 * NOTE: struct or the expected paymaster data is:
 * * [0x00:0x14                      ] token                 (IERC20)
 * * [0x14:0x1a                      ] validAfter            (uint48)
 * * [0x1a:0x20                      ] validUntil            (uint48)
 * * [0x20:0x40                      ] tokenPrice            (uint256)
 * * [0x40:0x54                      ] oracle                (address)
 * * [0x54:0x56                      ] oracleSignatureLength (uint16)
 * * [0x56:0x56+oracleSignatureLength] oracleSignature       (bytes)
 */
abstract contract PaymasterERC20MockUpgradeable is Initializable, EIP712Upgradeable, PaymasterERC20Upgradeable, AccessControlUpgradeable {
    using ERC4337Utils for *;

    bytes32 private constant ORACLE_ROLE = keccak256("ORACLE_ROLE");
    bytes32 private constant WITHDRAWER_ROLE = keccak256("WITHDRAWER_ROLE");
    bytes32 private constant TOKEN_PRICE_TYPEHASH =
        keccak256("TokenPrice(address token,uint48 validAfter,uint48 validUntil,uint256 tokenPrice)");

    function __PaymasterERC20Mock_init() internal onlyInitializing {
    }

    function __PaymasterERC20Mock_init_unchained() internal onlyInitializing {
    }
    function _fetchDetails(
        PackedUserOperation calldata userOp,
        bytes32 /* userOpHash */
    ) internal view virtual override returns (uint256 validationData, IERC20 token, uint256 tokenPrice) {
        bytes calldata paymasterData = userOp.paymasterData();

        // parse oracle and oracle signature
        address oracle = address(bytes20(paymasterData[0x40:0x54]));

        // check oracle is registered
        if (!hasRole(ORACLE_ROLE, oracle)) return (ERC4337Utils.SIG_VALIDATION_FAILED, IERC20(address(0)), 0);

        // parse repayment details
        token = IERC20(address(bytes20(paymasterData[0x00:0x14])));
        uint48 validAfter = uint48(bytes6(paymasterData[0x14:0x1a]));
        uint48 validUntil = uint48(bytes6(paymasterData[0x1a:0x20]));
        tokenPrice = uint256(bytes32(paymasterData[0x20:0x40]));

        // verify signature
        validationData = SignatureChecker
            .isValidSignatureNow(
                oracle,
                _hashTypedDataV4(
                    keccak256(abi.encode(TOKEN_PRICE_TYPEHASH, token, validAfter, validUntil, tokenPrice))
                ),
                paymasterData[0x56:0x56 + uint16(bytes2(paymasterData[0x54:0x56]))]
            )
            .packValidationData(validAfter, validUntil);
    }

    function deposit() public payable virtual {
        _deposit(msg.value);
    }

    function withdraw(address payable to, uint256 value) public virtual onlyRole(WITHDRAWER_ROLE) {
        _withdraw(to, value);
    }

    function addStake(uint32 unstakeDelaySec) public payable virtual {
        _addStake(msg.value, unstakeDelaySec);
    }

    function unlockStake() public virtual onlyRole(WITHDRAWER_ROLE) {
        _unlockStake();
    }

    function withdrawStake(address payable to) public virtual onlyRole(WITHDRAWER_ROLE) {
        _withdrawStake(to);
    }

    function _minTokensPerNative() internal view virtual override returns (uint256) {
        return 1;
    }

    function withdrawTokens(IERC20 token, address recipient, uint256 amount) public virtual onlyRole(WITHDRAWER_ROLE) {
        _withdrawTokens(token, recipient, amount);
    }
}

/**
 * NOTE: struct or the expected guarantor data is (starts at 0x56+oracleSignatureLength):
 * * [0x00:0x14                      ] guarantor                (address) (optional: 0 if no guarantor)
 * * [0x14:0x16                      ] guarantorSignatureLength (uint16)
 * * [0x16+guarantorSignatureLength  ] guarantorSignature       (bytes)
 */
abstract contract PaymasterERC20GuarantorMockUpgradeable is Initializable, PaymasterERC20MockUpgradeable, PaymasterERC20GuarantorUpgradeable {
    using ERC4337Utils for *;

    bytes32 private constant PACKED_USER_OPERATION_TYPEHASH =
        keccak256(
            "PackedUserOperation(address sender,uint256 nonce,bytes initCode,bytes callData,bytes32 accountGasLimits,uint256 preVerificationGas,bytes32 gasFees,bytes paymasterAndData)"
        );

    function __PaymasterERC20GuarantorMock_init() internal onlyInitializing {
    }

    function __PaymasterERC20GuarantorMock_init_unchained() internal onlyInitializing {
    }
    function _fetchGuarantor(
        PackedUserOperation calldata userOp
    ) internal view virtual override returns (address guarantor) {
        bytes calldata paymasterData = userOp.paymasterData();

        uint16 oracleSignatureLength = uint16(bytes2(paymasterData[0x54:0x56]));
        bytes calldata guarantorData = paymasterData[0x56 + oracleSignatureLength:];

        if (guarantorData.length < 0x16) return address(0);
        address guarantorInput = address(bytes20(guarantorData[0x00:0x14]));
        if (guarantorInput == address(0)) return guarantorInput;

        uint16 guarantorSignatureLength = uint16(bytes2(guarantorData[0x14:0x16]));
        bytes calldata guarantorSignature = guarantorData[0x16:0x16 + guarantorSignatureLength];
        return
            SignatureChecker.isValidSignatureNow(
                guarantorInput,
                _hashTypedDataV4(_getStructHashWithoutOracleAndGuarantorSignature(userOp)),
                guarantorSignature
            )
                ? guarantorInput
                : address(0);
    }

    function _refund(
        IERC20 token,
        uint256 actualAmount,
        uint256 tokenPrice,
        uint256 actualUserOpFeePerGas,
        address prefunder,
        uint256 prefundAmount,
        bytes calldata prefundContext
    ) internal virtual override(PaymasterERC20Upgradeable, PaymasterERC20GuarantorUpgradeable) returns (bool, uint256) {
        return
            super._refund(
                token,
                actualAmount,
                tokenPrice,
                actualUserOpFeePerGas,
                prefunder,
                prefundAmount,
                prefundContext
            );
    }

    function _prefund(
        PackedUserOperation calldata userOp,
        bytes32 userOpHash,
        IERC20 token,
        uint256 tokenPrice,
        address prefunder_,
        uint256 prefundAmount
    )
        internal
        virtual
        override(PaymasterERC20Upgradeable, PaymasterERC20GuarantorUpgradeable)
        returns (bool prefunded, address prefunder, uint256, bytes memory prefundContext)
    {
        return super._prefund(userOp, userOpHash, token, tokenPrice, prefunder_, prefundAmount);
    }

    function _getStructHashWithoutOracleAndGuarantorSignature(
        PackedUserOperation calldata userOp
    ) private pure returns (bytes32) {
        return
            keccak256(
                abi.encode(
                    PACKED_USER_OPERATION_TYPEHASH,
                    userOp.sender,
                    userOp.nonce,
                    keccak256(userOp.initCode),
                    keccak256(userOp.callData),
                    userOp.accountGasLimits,
                    userOp.preVerificationGas,
                    userOp.gasFees,
                    keccak256(userOp.paymasterAndData[:0x88]) // 0x34 (paymasterDataOffset) + 0x54 (token + validAfter + validUntil + tokenPrice + oracle)
                )
            );
    }

    function _minTokensPerNative()
        internal
        view
        virtual
        override(PaymasterERC20Upgradeable, PaymasterERC20MockUpgradeable)
        returns (uint256)
    {
        return super._minTokensPerNative();
    }
}
