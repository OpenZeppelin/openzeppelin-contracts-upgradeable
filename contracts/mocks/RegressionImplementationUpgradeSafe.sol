// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../proxy/InitializableUpgradeSafe.sol";
import "../Initializable.sol";

contract Implementation1UpgradeSafe is __Initializable, InitializableUpgradeSafe {
    function __Implementation1_init() internal __initializer {
        __Initializable_init_unchained();
        __Implementation1_init_unchained();
    }

    function __Implementation1_init_unchained() internal __initializer {
    }
  uint internal _value;

  function initialize() public initializer {
  }

  function setValue(uint _number) public {
    _value = _number;
  }
    uint256[49] private __gap;
}

contract Implementation2UpgradeSafe is __Initializable, InitializableUpgradeSafe {
    function __Implementation2_init() internal __initializer {
        __Initializable_init_unchained();
        __Implementation2_init_unchained();
    }

    function __Implementation2_init_unchained() internal __initializer {
    }
  uint internal _value;

  function initialize() public initializer {
  }

  function setValue(uint _number) public {
    _value = _number;
  }

  function getValue() public view returns (uint) {
    return _value;
  }
    uint256[49] private __gap;
}

contract Implementation3UpgradeSafe is __Initializable, InitializableUpgradeSafe {
    function __Implementation3_init() internal __initializer {
        __Initializable_init_unchained();
        __Implementation3_init_unchained();
    }

    function __Implementation3_init_unchained() internal __initializer {
    }
  uint internal _value;

  function initialize() public initializer {
  }

  function setValue(uint _number) public {
    _value = _number;
  }

  function getValue(uint _number) public view returns (uint) {
    return _value + _number;
  }
    uint256[49] private __gap;
}

contract Implementation4UpgradeSafe is __Initializable, InitializableUpgradeSafe {
    function __Implementation4_init() internal __initializer {
        __Initializable_init_unchained();
        __Implementation4_init_unchained();
    }

    function __Implementation4_init_unchained() internal __initializer {
    }
  uint internal _value;

  function initialize() public initializer {
  }

  function setValue(uint _number) public {
    _value = _number;
  }

  function getValue() public view returns (uint) {
    return _value;
  }

  // solhint-disable-next-line payable-fallback
  fallback() external {
    _value = 1;
  }
    uint256[49] private __gap;
}
