// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;
import "../proxy/Initializable.sol";

abstract contract ImplUpgradeable is Initializable {
    function __Impl_init() internal initializer {
        __Impl_init_unchained();
    }

    function __Impl_init_unchained() internal initializer {
    }
  function version() public pure virtual returns (string memory); 
    uint256[50] private __gap;
}

contract DummyImplementationUpgradeable is Initializable {
    function __DummyImplementation_init() internal initializer {
        __DummyImplementation_init_unchained();
    }

    function __DummyImplementation_init_unchained() internal initializer {
    }
  uint256 public value;
  string public text;
  uint256[] public values;

  function initializeNonPayable() public {
    value = 10;
  }

  function initializePayable() public payable {
    value = 100;
  }

  function initializeNonPayableWithValue(uint256 _value) public {
    value = _value;
  }

  function initializePayableWithValue(uint256 _value) public payable {
    value = _value;
  }

  function initialize(uint256 _value, string memory _text, uint256[] memory _values) public {
    value = _value;
    text = _text;
    values = _values;
  }

  function get() public pure returns (bool) {
    return true;
  }

  function version() public pure virtual returns (string memory) {
    return "V1";
  }

  function reverts() public pure {
    require(false, "DummyImplementation reverted");
  }
    uint256[47] private __gap;
}

contract DummyImplementationV2Upgradeable is Initializable, DummyImplementationUpgradeable {
    function __DummyImplementationV2_init() internal initializer {
        __DummyImplementation_init_unchained();
        __DummyImplementationV2_init_unchained();
    }

    function __DummyImplementationV2_init_unchained() internal initializer {
    }
  function migrate(uint256 newVal) public payable {
    value = newVal;
  }

  function version() public pure override returns (string memory) {
    return "V2";
  }
    uint256[50] private __gap;
}
