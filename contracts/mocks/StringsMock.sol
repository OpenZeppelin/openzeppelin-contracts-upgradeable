pragma solidity ^0.6.0;

import "../utils/Strings.sol";
import "../Initializable.sol";

contract StringsMockUpgradeable is Initializable {
    constructor() public  {
        __StringsMock_init();
    }

    function __StringsMock_init() internal initializer {
        __StringsMock_init_unchained();
    }

    function __StringsMock_init_unchained() internal initializer {


    }

    function fromUint256(uint256 value) public pure returns (string memory) {
        return Strings.toString(value);
    }

    uint256[50] private __gap;
}
