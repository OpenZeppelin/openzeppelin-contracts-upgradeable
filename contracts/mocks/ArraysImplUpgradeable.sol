// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../utils/ArraysUpgradeable.sol";
import "../proxy/Initializable.sol";

contract ArraysImplUpgradeable is Initializable {
    using ArraysUpgradeable for uint256[];

    uint256[] private _array;

    function __ArraysImpl_init(uint256[] memory array) internal initializer {
        __ArraysImpl_init_unchained(array);
    }

    function __ArraysImpl_init_unchained(uint256[] memory array) internal initializer {
        _array = array;
    }

    function findUpperBound(uint256 element) external view returns (uint256) {
        return _array.findUpperBound(element);
    }
    uint256[49] private __gap;
}
