// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../proxy/InitializableUpgradeSafe.sol";
import "../Initializable.sol";

/**
 * @title MigratableMockV1
 * @dev This contract is a mock to test initializable functionality through migrations
 */
contract MigratableMockV1UpgradeSafe is __Initializable, InitializableUpgradeSafe {
    function __MigratableMockV1_init() internal __initializer {
        __Initializable_init_unchained();
        __MigratableMockV1_init_unchained();
    }

    function __MigratableMockV1_init_unchained() internal __initializer {
    }
  uint256 public x;

  function initialize(uint256 value) public payable initializer {
    x = value;
  }
    uint256[49] private __gap;
}

/**
 * @title MigratableMockV2
 * @dev This contract is a mock to test migratable functionality with params
 */
contract MigratableMockV2UpgradeSafe is __Initializable, MigratableMockV1UpgradeSafe {
    function __MigratableMockV2_init() internal __initializer {
        __Initializable_init_unchained();
        __MigratableMockV1_init_unchained();
        __MigratableMockV2_init_unchained();
    }

    function __MigratableMockV2_init_unchained() internal __initializer {
    }
  bool internal _migratedV2;
  uint256 public y;

  function migrate(uint256 value, uint256 anotherValue) public payable {
    require(!_migratedV2);
    x = value;
    y = anotherValue;
    _migratedV2 = true;
  }
    uint256[48] private __gap;
}

/**
 * @title MigratableMockV3
 * @dev This contract is a mock to test migratable functionality without params
 */
contract MigratableMockV3UpgradeSafe is __Initializable, MigratableMockV2UpgradeSafe {
    function __MigratableMockV3_init() internal __initializer {
        __Initializable_init_unchained();
        __MigratableMockV1_init_unchained();
        __MigratableMockV2_init_unchained();
        __MigratableMockV3_init_unchained();
    }

    function __MigratableMockV3_init_unchained() internal __initializer {
    }
  bool internal _migratedV3;

  function migrate() public payable {
    require(!_migratedV3);
    uint256 oldX = x;
    x = y;
    y = oldX;
    _migratedV3 = true;
  }
    uint256[49] private __gap;
}
