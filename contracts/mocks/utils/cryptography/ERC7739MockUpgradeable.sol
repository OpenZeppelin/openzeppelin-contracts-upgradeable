// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {EIP712Upgradeable} from "../../../utils/cryptography/EIP712Upgradeable.sol";
import {ERC7739Upgradeable} from "../../../utils/cryptography/ERC7739Upgradeable.sol";
import {AbstractSigner} from "@openzeppelin/contracts/utils/cryptography/AbstractSigner.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

contract ERC7739ECDSAMockUpgradeable is Initializable, AbstractSigner, ERC7739Upgradeable {
    address private _signer;

    function __ERC7739ECDSAMock_init(address signerAddr) internal onlyInitializing {
        __EIP712_init_unchained("ERC7739ECDSA", "1");
        __ERC7739ECDSAMock_init_unchained(signerAddr);
    }

    function __ERC7739ECDSAMock_init_unchained(address signerAddr) internal onlyInitializing {
        _signer = signerAddr;
    }

    function signer() public view virtual returns (address) {
        return _signer;
    }

    function _rawSignatureValidation(
        bytes32 hash,
        bytes calldata signature
    ) internal view virtual override returns (bool) {
        (address recovered, ECDSA.RecoverError err, ) = ECDSA.tryRecover(hash, signature);
        return signer() == recovered && err == ECDSA.RecoverError.NoError;
    }
}
