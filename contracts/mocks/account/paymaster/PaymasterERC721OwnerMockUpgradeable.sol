// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {OwnableUpgradeable} from "../../../access/OwnableUpgradeable.sol";
import {ERC4337Utils} from "@openzeppelin/contracts/account/utils/ERC4337Utils.sol";
import {PackedUserOperation} from "@openzeppelin/contracts/interfaces/IERC4337.sol";
import {PaymasterERC721OwnerUpgradeable} from "../../../account/paymaster/extensions/PaymasterERC721OwnerUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract PaymasterERC721OwnerContextNoPostOpMockUpgradeable is Initializable, PaymasterERC721OwnerUpgradeable, OwnableUpgradeable {
    using ERC4337Utils for *;

    function __PaymasterERC721OwnerContextNoPostOpMock_init() internal onlyInitializing {
    }

    function __PaymasterERC721OwnerContextNoPostOpMock_init_unchained() internal onlyInitializing {
    }
    function _validatePaymasterUserOp(
        PackedUserOperation calldata userOp,
        bytes32 userOpHash,
        uint256 requiredPreFund
    ) internal override returns (bytes memory context, uint256 validationData) {
        // use the userOp's callData as context;
        context = userOp.callData;
        // super call (PaymasterERC721Owner) for the validation data
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

abstract contract PaymasterERC721OwnerMockUpgradeable is Initializable, PaymasterERC721OwnerContextNoPostOpMockUpgradeable {
    event PaymasterDataPostOp(bytes paymasterData);

    function __PaymasterERC721OwnerMock_init() internal onlyInitializing {
    }

    function __PaymasterERC721OwnerMock_init_unchained() internal onlyInitializing {
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
