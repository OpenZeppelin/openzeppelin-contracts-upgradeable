// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../utils/CountersUpgradeSafe.sol";
import "../proxy/Initializable.sol";

contract CountersImplUpgradeSafe is Initializable {
    function __CountersImpl_init() internal initializer {
        __CountersImpl_init_unchained();
    }

    function __CountersImpl_init_unchained() internal initializer {
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
    uint256[49] private __gap;
}
