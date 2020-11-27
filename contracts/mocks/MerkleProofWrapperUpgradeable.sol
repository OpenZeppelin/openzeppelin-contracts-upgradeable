// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import { MerkleProofUpgradeable } from "../cryptography/MerkleProofUpgradeable.sol";
import "../proxy/Initializable.sol";

contract MerkleProofWrapperUpgradeable is Initializable {
    function __MerkleProofWrapper_init() internal initializer {
        __MerkleProofWrapper_init_unchained();
    }

    function __MerkleProofWrapper_init_unchained() internal initializer {
    }
    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf) public pure returns (bool) {
        return MerkleProofUpgradeable.verify(proof, root, leaf);
    }
    uint256[50] private __gap;
}
