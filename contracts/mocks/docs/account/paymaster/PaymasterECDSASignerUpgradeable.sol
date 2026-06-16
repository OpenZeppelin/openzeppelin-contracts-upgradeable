// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {OwnableUpgradeable} from "../../../../access/OwnableUpgradeable.sol";
import {SignerECDSAUpgradeable} from "../../../../utils/cryptography/signers/SignerECDSAUpgradeable.sol";
import {PaymasterSignerUpgradeable, EIP712Upgradeable} from "../../../../account/paymaster/extensions/PaymasterSignerUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract PaymasterECDSASignerUpgradeable is Initializable, PaymasterSignerUpgradeable, SignerECDSAUpgradeable, OwnableUpgradeable {
    function __PaymasterECDSASigner_init(address signerAddr) internal onlyInitializing {
        __EIP712_init_unchained("MyPaymasterECDSASigner", "1");
        __SignerECDSA_init_unchained(signerAddr);
        __Ownable_init_unchained(signerAddr);
    }

    function __PaymasterECDSASigner_init_unchained(address) internal onlyInitializing {}

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
