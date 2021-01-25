// SPDX-License-Identifier: MIT

pragma solidity >=0.6.0 <0.8.0;

import "../proxy/ClonesUpgradeable.sol";
import "../utils/AddressUpgradeable.sol";
import "../proxy/Initializable.sol";

contract ClonesMockUpgradeable is Initializable {
    function __ClonesMock_init() internal initializer {
        __ClonesMock_init_unchained();
    }

    function __ClonesMock_init_unchained() internal initializer {
    }
    using AddressUpgradeable for address;
    using ClonesUpgradeable for address;

    event NewInstance(address instance);

    function clone(address master, bytes calldata initdata) public payable {
        _initAndEmit(master.clone(), initdata);
    }

    function cloneDeterministic(address master, bytes32 salt, bytes calldata initdata) public payable {
        _initAndEmit(master.cloneDeterministic(salt), initdata);
    }

    function predictDeterministicAddress(address master, bytes32 salt) public view returns (address predicted) {
        return master.predictDeterministicAddress(salt);
    }

    function _initAndEmit(address instance, bytes memory initdata) private {
        if (initdata.length > 0) {
            instance.functionCallWithValue(initdata, msg.value);
        }
        emit NewInstance(instance);
    }
    uint256[50] private __gap;
}
