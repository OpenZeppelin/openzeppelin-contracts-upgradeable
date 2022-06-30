// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../utils/cryptography/MerkleProofUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract MerkleProofWrapperUpgradeable is Initializable {
    function __MerkleProofWrapper_init() internal onlyInitializing {
    }

    function __MerkleProofWrapper_init_unchained() internal onlyInitializing {
    }
    function verify(
        bytes32[] memory proof,
        bytes32 root,
        bytes32 leaf
    ) public pure returns (bool) {
        return MerkleProofUpgradeable.verify(proof, root, leaf);
    }

    function verifyCalldata(
        bytes32[] calldata proof,
        bytes32 root,
        bytes32 leaf
    ) public pure returns (bool) {
        return MerkleProofUpgradeable.verifyCalldata(proof, root, leaf);
    }

    function processProof(bytes32[] memory proof, bytes32 leaf) public pure returns (bytes32) {
        return MerkleProofUpgradeable.processProof(proof, leaf);
    }

    function processProofCalldata(bytes32[] calldata proof, bytes32 leaf) public pure returns (bytes32) {
        return MerkleProofUpgradeable.processProofCalldata(proof, leaf);
    }

    function multiProofVerify(
        bytes32[] memory proofs,
        bool[] memory proofFlag,
        bytes32 root,
        bytes32[] memory leaves
    ) public pure returns (bool) {
        return MerkleProofUpgradeable.multiProofVerify(proofs, proofFlag, root, leaves);
    }

    function multiProofVerifyCalldata(
        bytes32[] calldata proofs,
        bool[] calldata proofFlag,
        bytes32 root,
        bytes32[] memory leaves
    ) public pure returns (bool) {
        return MerkleProofUpgradeable.multiProofVerifyCalldata(proofs, proofFlag, root, leaves);
    }

    function processMultiProof(
        bytes32[] memory proofs,
        bool[] memory proofFlag,
        bytes32[] memory leaves
    ) public pure returns (bytes32) {
        return MerkleProofUpgradeable.processMultiProof(proofs, proofFlag, leaves);
    }

    function processMultiProofCalldata(
        bytes32[] calldata proofs,
        bool[] calldata proofFlag,
        bytes32[] memory leaves
    ) public pure returns (bytes32) {
        return MerkleProofUpgradeable.processMultiProofCalldata(proofs, proofFlag, leaves);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
