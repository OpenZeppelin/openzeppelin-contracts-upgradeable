// SPDX-License-Identifier: MIT
// This file was procedurally generated from scripts/generate/templates/CheckpointsMock.js.

pragma solidity ^0.8.0;

import "../utils/CheckpointsUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract CheckpointsMockUpgradeable is Initializable {
    function __CheckpointsMock_init() internal onlyInitializing {
    }

    function __CheckpointsMock_init_unchained() internal onlyInitializing {
    }
    using CheckpointsUpgradeable for CheckpointsUpgradeable.History;

    CheckpointsUpgradeable.History private _totalCheckpoints;

    function latest() public view returns (uint256) {
        return _totalCheckpoints.latest();
    }

    function latestCheckpoint()
        public
        view
        returns (
            bool,
            uint256,
            uint256
        )
    {
        return _totalCheckpoints.latestCheckpoint();
    }

    function length() public view returns (uint256) {
        return _totalCheckpoints.length();
    }

    function push(uint256 value) public returns (uint256, uint256) {
        return _totalCheckpoints.push(value);
    }

    function getAtBlock(uint256 blockNumber) public view returns (uint256) {
        return _totalCheckpoints.getAtBlock(blockNumber);
    }

    function getAtProbablyRecentBlock(uint256 blockNumber) public view returns (uint256) {
        return _totalCheckpoints.getAtProbablyRecentBlock(blockNumber);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}

contract Checkpoints224MockUpgradeable is Initializable {
    function __Checkpoints224Mock_init() internal onlyInitializing {
    }

    function __Checkpoints224Mock_init_unchained() internal onlyInitializing {
    }
    using CheckpointsUpgradeable for CheckpointsUpgradeable.Trace224;

    CheckpointsUpgradeable.Trace224 private _totalCheckpoints;

    function latest() public view returns (uint224) {
        return _totalCheckpoints.latest();
    }

    function latestCheckpoint()
        public
        view
        returns (
            bool,
            uint32,
            uint224
        )
    {
        return _totalCheckpoints.latestCheckpoint();
    }

    function length() public view returns (uint256) {
        return _totalCheckpoints.length();
    }

    function push(uint32 key, uint224 value) public returns (uint224, uint224) {
        return _totalCheckpoints.push(key, value);
    }

    function lowerLookup(uint32 key) public view returns (uint224) {
        return _totalCheckpoints.lowerLookup(key);
    }

    function upperLookup(uint32 key) public view returns (uint224) {
        return _totalCheckpoints.upperLookup(key);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}

contract Checkpoints160MockUpgradeable is Initializable {
    function __Checkpoints160Mock_init() internal onlyInitializing {
    }

    function __Checkpoints160Mock_init_unchained() internal onlyInitializing {
    }
    using CheckpointsUpgradeable for CheckpointsUpgradeable.Trace160;

    CheckpointsUpgradeable.Trace160 private _totalCheckpoints;

    function latest() public view returns (uint160) {
        return _totalCheckpoints.latest();
    }

    function latestCheckpoint()
        public
        view
        returns (
            bool,
            uint96,
            uint160
        )
    {
        return _totalCheckpoints.latestCheckpoint();
    }

    function length() public view returns (uint256) {
        return _totalCheckpoints.length();
    }

    function push(uint96 key, uint160 value) public returns (uint160, uint160) {
        return _totalCheckpoints.push(key, value);
    }

    function lowerLookup(uint96 key) public view returns (uint160) {
        return _totalCheckpoints.lowerLookup(key);
    }

    function upperLookup(uint96 key) public view returns (uint160) {
        return _totalCheckpoints.upperLookup(key);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[49] private __gap;
}
