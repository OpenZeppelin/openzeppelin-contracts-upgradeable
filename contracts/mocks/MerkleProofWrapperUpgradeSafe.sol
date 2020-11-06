// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import { MerkleProofUpgradeSafe } from "../cryptography/MerkleProofUpgradeSafe.sol";
import "../Initializable.sol";

contract MerkleProofWrapperUpgradeSafe is __Initializable {
    function __MerkleProofWrapper_init() internal __initializer {
        __MerkleProofWrapper_init_unchained();
    }

    function __MerkleProofWrapper_init_unchained() internal __initializer {
    }
    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf) public pure returns (bool) {
        return MerkleProofUpgradeSafe.verify(proof, root, leaf);
    }
}
