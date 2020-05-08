pragma solidity ^0.6.0;

import '../payment/escrow/RefundEscrow.sol';

contract RefundEscrowMock is RefundEscrow {
    constructor (address payable beneficiary) public payable RefundEscrow(beneficiary) {
    }
}
