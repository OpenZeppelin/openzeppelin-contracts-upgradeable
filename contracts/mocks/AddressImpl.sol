pragma solidity ^0.6.0;

import "../utils/Address.sol";
import "../Initializable.sol";

contract AddressMockUpgradeSafe is Initializable {
    constructor() public  {
        __AddressMock_init();
    }

    function __AddressMock_init() internal initializer {
        __AddressMock_init_unchained();
    }

    function __AddressMock_init_unchained() internal initializer {


    }

    function isContract(address account) external view returns (bool) {
        return Address.isContract(account);
    }

    function sendValue(address payable receiver, uint256 amount) external {
        Address.sendValue(receiver, amount);
    }

    // sendValue's tests require the contract to hold Ether
    receive () external payable { }

    uint256[50] private __gap;
}
