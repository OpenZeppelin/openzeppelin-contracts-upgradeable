// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

// We keep these imports and a dummy contract just to we can run the test suite after transpilation.

import {AddressUpgradeable} from "../utils/AddressUpgradeable.sol";
import {ArraysUpgradeable} from "../utils/ArraysUpgradeable.sol";
import {AuthorityUtilsUpgradeable} from "../access/manager/AuthorityUtilsUpgradeable.sol";
import {Base64Upgradeable} from "../utils/Base64Upgradeable.sol";
import {BitMapsUpgradeable} from "../utils/structs/BitMapsUpgradeable.sol";
import {CheckpointsUpgradeable} from "../utils/structs/CheckpointsUpgradeable.sol";
import {ClonesUpgradeable} from "../proxy/ClonesUpgradeable.sol";
import {Create2Upgradeable} from "../utils/Create2Upgradeable.sol";
import {DoubleEndedQueueUpgradeable} from "../utils/structs/DoubleEndedQueueUpgradeable.sol";
import {ECDSAUpgradeable} from "../utils/cryptography/ECDSAUpgradeable.sol";
import {EnumerableMapUpgradeable} from "../utils/structs/EnumerableMapUpgradeable.sol";
import {EnumerableSetUpgradeable} from "../utils/structs/EnumerableSetUpgradeable.sol";
import {ERC1155HolderUpgradeable} from "../token/ERC1155/utils/ERC1155HolderUpgradeable.sol";
import {ERC165Upgradeable} from "../utils/introspection/ERC165Upgradeable.sol";
import {ERC165CheckerUpgradeable} from "../utils/introspection/ERC165CheckerUpgradeable.sol";
import {ERC1967UtilsUpgradeable} from "../proxy/ERC1967/ERC1967UtilsUpgradeable.sol";
import {ERC721HolderUpgradeable} from "../token/ERC721/utils/ERC721HolderUpgradeable.sol";
import {MathUpgradeable} from "../utils/math/MathUpgradeable.sol";
import {MerkleProofUpgradeable} from "../utils/cryptography/MerkleProofUpgradeable.sol";
import {MessageHashUtilsUpgradeable} from "../utils/cryptography/MessageHashUtilsUpgradeable.sol";
import {SafeCastUpgradeable} from "../utils/math/SafeCastUpgradeable.sol";
import {SafeERC20Upgradeable} from "../token/ERC20/utils/SafeERC20Upgradeable.sol";
import {ShortStringsUpgradeable} from "../utils/ShortStringsUpgradeable.sol";
import {SignatureCheckerUpgradeable} from "../utils/cryptography/SignatureCheckerUpgradeable.sol";
import {SignedMathUpgradeable} from "../utils/math/SignedMathUpgradeable.sol";
import {StorageSlotUpgradeable} from "../utils/StorageSlotUpgradeable.sol";
import {StringsUpgradeable} from "../utils/StringsUpgradeable.sol";
import {TimeUpgradeable} from "../utils/types/TimeUpgradeable.sol";
import {Initializable} from "../proxy/utils/Initializable.sol";

contract Dummy1234Upgradeable is Initializable {    function __Dummy1234_init() internal onlyInitializing {
    }

    function __Dummy1234_init_unchained() internal onlyInitializing {
    }
}
