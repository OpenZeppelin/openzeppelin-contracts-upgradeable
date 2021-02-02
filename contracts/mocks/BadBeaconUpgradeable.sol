// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;
import "../proxy/Initializable.sol";

contract BadBeaconNoImplUpgradeable is Initializable {
    function __BadBeaconNoImpl_init() internal initializer {
        __BadBeaconNoImpl_init_unchained();
    }

    function __BadBeaconNoImpl_init_unchained() internal initializer {
    }
    uint256[50] private __gap;
}

contract BadBeaconNotContractUpgradeable is Initializable {
    function __BadBeaconNotContract_init() internal initializer {
        __BadBeaconNotContract_init_unchained();
    }

    function __BadBeaconNotContract_init_unchained() internal initializer {
    }
    function implementation() external pure returns (address) {
        return address(0x1);
    }
    uint256[50] private __gap;
}
