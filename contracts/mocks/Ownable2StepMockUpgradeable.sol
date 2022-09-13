// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../access/Ownable2StepUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract Ownable2StepMockUpgradeable is Initializable, Ownable2StepUpgradeable {    function __Ownable2StepMock_init() internal onlyInitializing {
        __Ownable_init_unchained();
    }

    function __Ownable2StepMock_init_unchained() internal onlyInitializing {
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
