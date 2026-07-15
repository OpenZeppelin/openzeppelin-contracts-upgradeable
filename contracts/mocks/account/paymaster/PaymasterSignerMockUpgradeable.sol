// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {OwnableUpgradeable} from "../../../access/OwnableUpgradeable.sol";
import {ERC4337Utils} from "@openzeppelin/contracts/account/utils/ERC4337Utils.sol";
import {PackedUserOperation} from "@openzeppelin/contracts/interfaces/IERC4337.sol";
import {SignerECDSAUpgradeable} from "../../../utils/cryptography/signers/SignerECDSAUpgradeable.sol";
import {PaymasterSignerUpgradeable} from "../../../account/paymaster/extensions/PaymasterSignerUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract PaymasterSignerContextNoPostOpMockUpgradeable is Initializable, PaymasterSignerUpgradeable, SignerECDSAUpgradeable, OwnableUpgradeable {
    using ERC4337Utils for *;

    function __PaymasterSignerContextNoPostOpMock_init() internal onlyInitializing {
    }

    function __PaymasterSignerContextNoPostOpMock_init_unchained() internal onlyInitializing {
    }
    function _validatePaymasterUserOp(
        PackedUserOperation calldata userOp,
        bytes32 userOpHash,
        uint256 requiredPreFund
    ) internal override returns (bytes memory context, uint256 validationData) {
        // use the userOp's callData as context;
        context = userOp.callData;
        // super call (PaymasterSigner + SignerECDSA) for the validation data
        (, validationData) = super._validatePaymasterUserOp(userOp, userOpHash, requiredPreFund);
    }

    function deposit() public payable virtual {
        _deposit(msg.value);
    }

    function withdraw(address payable to, uint256 value) public virtual onlyOwner {
        _withdraw(to, value);
    }

    function addStake(uint32 unstakeDelaySec) public payable virtual {
        _addStake(msg.value, unstakeDelaySec);
    }

    function unlockStake() public virtual onlyOwner {
        _unlockStake();
    }

    function withdrawStake(address payable to) public virtual onlyOwner {
        _withdrawStake(to);
    }
}

abstract contract PaymasterSignerMockUpgradeable is Initializable, PaymasterSignerContextNoPostOpMockUpgradeable {
    event PaymasterDataPostOp(bytes paymasterData);

    function __PaymasterSignerMock_init() internal onlyInitializing {
    }

    function __PaymasterSignerMock_init_unchained() internal onlyInitializing {
    }
    function _postOp(
        PostOpMode mode,
        bytes calldata context,
        uint256 actualGasCost,
        uint256 actualUserOpFeePerGas
    ) internal override {
        emit PaymasterDataPostOp(context);
        super._postOp(mode, context, actualGasCost, actualUserOpFeePerGas);
    }
}
