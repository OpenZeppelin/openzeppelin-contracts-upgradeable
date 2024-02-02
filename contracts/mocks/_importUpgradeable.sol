// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Address} from "@openzeppelin/contracts/utils/Address.sol";
import {Arrays} from "@openzeppelin/contracts/utils/Arrays.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {BitMaps} from "@openzeppelin/contracts/utils/structs/BitMaps.sol";
import {Checkpoints} from "@openzeppelin/contracts/utils/structs/Checkpoints.sol";
import {ContextUpgradeable} from "../utils/ContextUpgradeable.sol";
import {Create2} from "@openzeppelin/contracts/utils/Create2.sol";
import {DoubleEndedQueue} from "@openzeppelin/contracts/utils/structs/DoubleEndedQueue.sol";
import {ECDSA} from "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import {EIP712Upgradeable} from "../utils/cryptography/EIP712Upgradeable.sol";
import {EnumerableMap} from "@openzeppelin/contracts/utils/structs/EnumerableMap.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";
import {ERC165Upgradeable} from "../utils/introspection/ERC165Upgradeable.sol";
import {ERC165Checker} from "@openzeppelin/contracts/utils/introspection/ERC165Checker.sol";
import {IERC165} from "@openzeppelin/contracts/utils/introspection/IERC165.sol";
import {Math} from "@openzeppelin/contracts/utils/math/Math.sol";
import {MerkleProof} from "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import {MessageHashUtils} from "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";
import {MulticallUpgradeable} from "../utils/MulticallUpgradeable.sol";
import {NoncesUpgradeable} from "../utils/NoncesUpgradeable.sol";
import {Panic} from "@openzeppelin/contracts/utils/Panic.sol";
import {PausableUpgradeable} from "../utils/PausableUpgradeable.sol";
import {ReentrancyGuardUpgradeable} from "../utils/ReentrancyGuardUpgradeable.sol";
import {SafeCast} from "@openzeppelin/contracts/utils/math/SafeCast.sol";
import {ShortStrings} from "@openzeppelin/contracts/utils/ShortStrings.sol";
import {SignatureChecker} from "@openzeppelin/contracts/utils/cryptography/SignatureChecker.sol";
import {SignedMath} from "@openzeppelin/contracts/utils/math/SignedMath.sol";
import {StorageSlot} from "@openzeppelin/contracts/utils/StorageSlot.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Time} from "@openzeppelin/contracts/utils/types/Time.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

abstract contract ExposeImportsUpgradeable is Initializable {
    function __ExposeImports_init() internal onlyInitializing {
    }

    function __ExposeImports_init_unchained() internal onlyInitializing {
    }
    // This will be transpiled, causing all the imports above to be transpiled when running the upgradeable tests.
    // This trick is necessary for testing libraries such as Panic.sol (which are not imported by any other transpiled
    // contracts and would otherwise not be exposed).
}
