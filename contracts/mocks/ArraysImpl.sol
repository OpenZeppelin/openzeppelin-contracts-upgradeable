pragma solidity ^0.6.0;

import "../utils/Arrays.sol";
import "../Initializable.sol";

contract ArraysMockUpgradeSafe is Initializable {
    using Arrays for uint256[];

    uint256[] private _array;


    constructor(uint256[] memory array) public  {
        __ArraysMock_init(array);
    }

    function __ArraysMock_init(uint256[] memory array) internal initializer {
        __ArraysMock_init_unchained(array);
    }

    function __ArraysMock_init_unchained(uint256[] memory array) internal initializer {


        _array = array;

    }


    function findUpperBound(uint256 element) external view returns (uint256) {
        return _array.findUpperBound(element);
    }

    uint256[49] private __gap;
}
