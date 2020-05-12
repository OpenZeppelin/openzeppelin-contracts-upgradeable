pragma solidity ^0.6.0;

import "../math/Math.sol";
import "../Initializable.sol";

contract MathMockUpgradeable is Initializable {
    constructor() public  {
        __MathMock_init();
    }

    function __MathMock_init() internal initializer {
        __MathMock_init_unchained();
    }

    function __MathMock_init_unchained() internal initializer {


    }

    function max(uint256 a, uint256 b) public pure returns (uint256) {
        return Math.max(a, b);
    }

    function min(uint256 a, uint256 b) public pure returns (uint256) {
        return Math.min(a, b);
    }

    function average(uint256 a, uint256 b) public pure returns (uint256) {
        return Math.average(a, b);
    }

    uint256[50] private __gap;
}
