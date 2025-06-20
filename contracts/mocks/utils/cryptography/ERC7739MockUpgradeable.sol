// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {ERC7739Upgradeable} from "../../../utils/cryptography/signers/draft-ERC7739Upgradeable.sol";
import {SignerECDSAUpgradeable} from "../../../utils/cryptography/signers/SignerECDSAUpgradeable.sol";
import {SignerP256Upgradeable} from "../../../utils/cryptography/signers/SignerP256Upgradeable.sol";
import {SignerRSAUpgradeable} from "../../../utils/cryptography/signers/SignerRSAUpgradeable.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

abstract contract ERC7739ECDSAMockUpgradeable is Initializable, ERC7739Upgradeable, SignerECDSAUpgradeable {    function __ERC7739ECDSAMock_init() internal onlyInitializing {
    }

    function __ERC7739ECDSAMock_init_unchained() internal onlyInitializing {
    }
}
abstract contract ERC7739P256MockUpgradeable is Initializable, ERC7739Upgradeable, SignerP256Upgradeable {    function __ERC7739P256Mock_init() internal onlyInitializing {
    }

    function __ERC7739P256Mock_init_unchained() internal onlyInitializing {
    }
}
abstract contract ERC7739RSAMockUpgradeable is Initializable, ERC7739Upgradeable, SignerRSAUpgradeable {    function __ERC7739RSAMock_init() internal onlyInitializing {
    }

    function __ERC7739RSAMock_init_unchained() internal onlyInitializing {
    }
}
