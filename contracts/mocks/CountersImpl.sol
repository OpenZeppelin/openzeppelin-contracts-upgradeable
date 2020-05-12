pragma solidity ^0.6.0;

import "../utils/Counters.sol";
import "../Initializable.sol";

contract CountersMockUpgradeable is Initializable {
    constructor() public  {
        __CountersMock_init();
    }

    function __CountersMock_init() internal initializer {
        __CountersMock_init_unchained();
    }

    function __CountersMock_init_unchained() internal initializer {


    }

    using Counters for Counters.Counter;

    Counters.Counter private _counter;

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
