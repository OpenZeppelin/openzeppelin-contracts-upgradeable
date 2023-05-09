// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../utils/math/SafeMathUpgradeable.sol";

library SafeMathMemoryCheckUpgradeable {
    function addMemoryCheck() internal pure returns (uint256 mem) {
        uint256 length = 32;
        assembly {
            mem := mload(0x40)
        }
        for (uint256 i = 0; i < length; ++i) {
            SafeMathUpgradeable.add(1, 1);
        }
        assembly {
            mem := sub(mload(0x40), mem)
        }
    }

    function subMemoryCheck() internal pure returns (uint256 mem) {
        uint256 length = 32;
        assembly {
            mem := mload(0x40)
        }
        for (uint256 i = 0; i < length; ++i) {
            SafeMathUpgradeable.sub(1, 1);
        }
        assembly {
            mem := sub(mload(0x40), mem)
        }
    }

    function mulMemoryCheck() internal pure returns (uint256 mem) {
        uint256 length = 32;
        assembly {
            mem := mload(0x40)
        }
        for (uint256 i = 0; i < length; ++i) {
            SafeMathUpgradeable.mul(1, 1);
        }
        assembly {
            mem := sub(mload(0x40), mem)
        }
    }

    function divMemoryCheck() internal pure returns (uint256 mem) {
        uint256 length = 32;
        assembly {
            mem := mload(0x40)
        }
        for (uint256 i = 0; i < length; ++i) {
            SafeMathUpgradeable.div(1, 1);
        }
        assembly {
            mem := sub(mload(0x40), mem)
        }
    }

    function modMemoryCheck() internal pure returns (uint256 mem) {
        uint256 length = 32;
        assembly {
            mem := mload(0x40)
        }
        for (uint256 i = 0; i < length; ++i) {
            SafeMathUpgradeable.mod(1, 1);
        }
        assembly {
            mem := sub(mload(0x40), mem)
        }
    }
}
