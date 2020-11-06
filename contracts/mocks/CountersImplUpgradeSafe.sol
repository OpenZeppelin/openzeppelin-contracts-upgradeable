// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/CountersUpgradeSafe.sol";
import "../Initializable.sol";

contract CountersImplUpgradeSafe is __Initializable {
    function __CountersImpl_init() internal __initializer {
        __CountersImpl_init_unchained();
    }

    function __CountersImpl_init_unchained() internal __initializer {
    }
    using CountersUpgradeSafe for CountersUpgradeSafe.Counter;

    CountersUpgradeSafe.Counter private _counter;

    function current() public view returns (uint256) {
        return _counter.current();
    }

    function increment() public {
        _counter.increment();
    }

    function decrement() public {
        _counter.decrement();
    }
}
