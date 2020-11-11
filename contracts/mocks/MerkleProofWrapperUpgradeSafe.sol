// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import { MerkleProofUpgradeSafe } from "../cryptography/MerkleProofUpgradeSafe.sol";
import "../proxy/Initializable.sol";

contract MerkleProofWrapperUpgradeSafe is Initializable {
    function __MerkleProofWrapper_init() internal initializer {
        __MerkleProofWrapper_init_unchained();
    }

    function __MerkleProofWrapper_init_unchained() internal initializer {
    }
    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf) public pure returns (bool) {
        return MerkleProofUpgradeSafe.verify(proof, root, leaf);
    }
    uint256[50] private __gap;
}
