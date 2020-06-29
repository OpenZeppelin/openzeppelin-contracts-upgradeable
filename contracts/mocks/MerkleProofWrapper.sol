// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import { MerkleProof } from "../cryptography/MerkleProof.sol";
import "../Initializable.sol";

contract MerkleProofWrapperUpgradeSafe is Initializable {
    constructor() public  {
        __MerkleProofWrapper_init();
    }

    function __MerkleProofWrapper_init() internal initializer {
        __MerkleProofWrapper_init_unchained();
    }

    function __MerkleProofWrapper_init_unchained() internal initializer {


    }

    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf) public pure returns (bool) {
        return MerkleProof.verify(proof, root, leaf);
    }

    uint256[50] private __gap;
}
