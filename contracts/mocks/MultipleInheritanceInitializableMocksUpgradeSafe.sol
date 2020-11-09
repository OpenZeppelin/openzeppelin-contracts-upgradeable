// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../proxy/InitializableUpgradeSafe.sol";
import "../Initializable.sol";

// Sample contracts showing upgradeability with multiple inheritance.
// Child contract inherits from Father and Mother contracts, and Father extends from Gramps.
// 
//         Human
//       /       \
//      |       Gramps
//      |         |
//    Mother    Father
//      |         |
//      -- Child --

/**
 * Sample base intializable contract that is a human
 */
contract SampleHumanUpgradeSafe is __Initializable, InitializableUpgradeSafe {
    function __SampleHuman_init() internal __initializer {
        __Initializable_init_unchained();
        __SampleHuman_init_unchained();
    }

    function __SampleHuman_init_unchained() internal __initializer {
    }
  bool public isHuman;

  function initialize() public initializer {
    isHuman = true;
  }
    uint256[49] private __gap;
}

/**
 * Sample base intializable contract that defines a field mother
 */
contract SampleMotherUpgradeSafe is __Initializable, InitializableUpgradeSafe, SampleHumanUpgradeSafe {
    function __SampleMother_init() internal __initializer {
        __Initializable_init_unchained();
        __SampleHuman_init_unchained();
        __SampleMother_init_unchained();
    }

    function __SampleMother_init_unchained() internal __initializer {
    }
  uint256 public mother;

  function initialize(uint256 value) public initializer virtual {
    SampleHumanUpgradeSafe.initialize();
    mother = value;
  }
    uint256[49] private __gap;
}

/**
 * Sample base intializable contract that defines a field gramps
 */
contract SampleGrampsUpgradeSafe is __Initializable, InitializableUpgradeSafe, SampleHumanUpgradeSafe {
    function __SampleGramps_init() internal __initializer {
        __Initializable_init_unchained();
        __SampleHuman_init_unchained();
        __SampleGramps_init_unchained();
    }

    function __SampleGramps_init_unchained() internal __initializer {
    }
  string public gramps;

  function initialize(string memory value) public initializer virtual {
    SampleHumanUpgradeSafe.initialize();
    gramps = value;
  }
    uint256[49] private __gap;
}

/**
 * Sample base intializable contract that defines a field father and extends from gramps
 */
contract SampleFatherUpgradeSafe is __Initializable, InitializableUpgradeSafe, SampleGrampsUpgradeSafe {
    function __SampleFather_init() internal __initializer {
        __Initializable_init_unchained();
        __SampleHuman_init_unchained();
        __SampleGramps_init_unchained();
        __SampleFather_init_unchained();
    }

    function __SampleFather_init_unchained() internal __initializer {
    }
  uint256 public father;

  function initialize(string memory _gramps, uint256 _father) public initializer {
    SampleGrampsUpgradeSafe.initialize(_gramps);
    father = _father;
  }
    uint256[49] private __gap;
}

/**
 * Child extends from mother, father (gramps)
 */
contract SampleChildUpgradeSafe is __Initializable, InitializableUpgradeSafe, SampleMotherUpgradeSafe, SampleFatherUpgradeSafe {
    function __SampleChild_init() internal __initializer {
        __Initializable_init_unchained();
        __SampleHuman_init_unchained();
        __SampleMother_init_unchained();
        __SampleGramps_init_unchained();
        __SampleFather_init_unchained();
        __SampleChild_init_unchained();
    }

    function __SampleChild_init_unchained() internal __initializer {
    }
  uint256 public child;

  function initialize(uint256 _mother, string memory _gramps, uint256 _father, uint256 _child) public initializer {
    SampleMotherUpgradeSafe.initialize(_mother);
    SampleFatherUpgradeSafe.initialize(_gramps, _father);
    child = _child;
  }
    uint256[49] private __gap;
}
