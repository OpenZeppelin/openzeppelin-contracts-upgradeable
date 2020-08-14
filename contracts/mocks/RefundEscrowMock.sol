pragma solidity ^0.6.0;

import "../payment/escrow/RefundEscrow.sol";
import "../Initializable.sol";

contract RefundEscrowMockUpgradeSafe is Initializable, RefundEscrowUpgradeSafe {

    constructor(address payable beneficiary) public payable {
        __RefundEscrowMock_init(beneficiary);
    }

    function __RefundEscrowMock_init(address payable beneficiary) internal initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
        __Escrow_init_unchained();
        __ConditionalEscrow_init_unchained();
        __RefundEscrow_init_unchained(beneficiary);
        __RefundEscrowMock_init_unchained(beneficiary);
    }

    function __RefundEscrowMock_init_unchained(address payable beneficiary) internal initializer {



    }


    uint256[50] private __gap;
}
