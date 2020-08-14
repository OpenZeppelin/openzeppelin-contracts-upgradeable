pragma solidity ^0.6.0;

import "../payment/PaymentSplitter.sol";
import "../Initializable.sol";

contract PaymentSplitterMockUpgradeSafe is Initializable, PaymentSplitterUpgradeSafe {

    constructor(address[] memory payees, uint256[] memory shares) public payable {
        __PaymentSplitterMock_init(payees, shares);
    }

    function __PaymentSplitterMock_init(address[] memory payees, uint256[] memory shares) internal initializer {
        __Context_init_unchained();
        __PaymentSplitter_init_unchained(payees, shares);
        __PaymentSplitterMock_init_unchained(payees, shares);
    }

    function __PaymentSplitterMock_init_unchained(address[] memory payees, uint256[] memory shares) internal initializer {



    }


    uint256[50] private __gap;
}
