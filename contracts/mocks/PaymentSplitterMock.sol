pragma solidity ^0.6.0;

import '../payment/PaymentSplitter.sol';

contract PaymentSplitterMock is PaymentSplitter {
    constructor (address[] memory payees, uint256[] memory shares) public payable PaymentSplitter(payees, shares) {
    }
}
