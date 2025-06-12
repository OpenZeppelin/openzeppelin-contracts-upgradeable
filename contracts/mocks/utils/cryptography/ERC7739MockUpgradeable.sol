// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {EIP712Upgradeable} from "../../../utils/cryptography/EIP712Upgradeable.sol";
import {ERC7739Upgradeable} from "../../../utils/cryptography/signers/draft-ERC7739Upgradeable.sol";
import {SignerECDSAUpgradeable} from "../../../utils/cryptography/signers/SignerECDSAUpgradeable.sol";
import {SignerP256Upgradeable} from "../../../utils/cryptography/signers/SignerP256Upgradeable.sol";
import {SignerRSAUpgradeable} from "../../../utils/cryptography/signers/SignerRSAUpgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

contract ERC7739ECDSAMockUpgradeable is Initializable, ERC7739Upgradeable, SignerECDSAUpgradeable {
    function __ERC7739ECDSAMock_init(address signerAddr) internal onlyInitializing {
        __EIP712_init_unchained("ERC7739ECDSA", "1");
        __ERC7739ECDSAMock_init_unchained(signerAddr);
    }

    function __ERC7739ECDSAMock_init_unchained(address signerAddr) internal onlyInitializing {
        _setSigner(signerAddr);
    }
}

contract ERC7739P256MockUpgradeable is Initializable, ERC7739Upgradeable, SignerP256Upgradeable {
    function __ERC7739P256Mock_init(bytes32 qx, bytes32 qy) internal onlyInitializing {
        __EIP712_init_unchained("ERC7739P256", "1");
        __ERC7739P256Mock_init_unchained(qx, qy);
    }

    function __ERC7739P256Mock_init_unchained(bytes32 qx, bytes32 qy) internal onlyInitializing {
        _setSigner(qx, qy);
    }
}

contract ERC7739RSAMockUpgradeable is Initializable, ERC7739Upgradeable, SignerRSAUpgradeable {
    function __ERC7739RSAMock_init(bytes memory e, bytes memory n) internal onlyInitializing {
        __EIP712_init_unchained("ERC7739RSA", "1");
        __ERC7739RSAMock_init_unchained(e, n);
    }

    function __ERC7739RSAMock_init_unchained(bytes memory e, bytes memory n) internal onlyInitializing {
        _setSigner(e, n);
    }
}
