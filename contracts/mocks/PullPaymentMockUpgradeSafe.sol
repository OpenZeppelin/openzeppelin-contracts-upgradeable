// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../payment/PullPaymentUpgradeSafe.sol";
import "../Initializable.sol";

// mock class using PullPayment
contract PullPaymentMockUpgradeSafe is __Initializable, PullPaymentUpgradeSafe {
    function __PullPaymentMock_init() internal __initializer {
        __PullPayment_init_unchained();
        __PullPaymentMock_init_unchained();
    }

    function __PullPaymentMock_init_unchained() internal __initializer { }

    // test helper function to call asyncTransfer
    function callTransfer(address dest, uint256 amount) public {
        _asyncTransfer(dest, amount);
    }
}
