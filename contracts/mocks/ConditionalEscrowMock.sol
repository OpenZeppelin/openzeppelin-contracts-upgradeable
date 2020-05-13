pragma solidity ^0.6.0;

import "../payment/escrow/ConditionalEscrow.sol";
import "../Initializable.sol";

// mock class using ConditionalEscrow
contract ConditionalEscrowMockUpgradeSafe is Initializable, ConditionalEscrowUpgradeSafe {
    constructor() public  {
        __ConditionalEscrowMock_init();
    }

    function __ConditionalEscrowMock_init() internal initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
        __Escrow_init_unchained();
        __ConditionalEscrow_init_unchained();
        __ConditionalEscrowMock_init_unchained();
    }

    function __ConditionalEscrowMock_init_unchained() internal initializer {


    }

    mapping(address => bool) private _allowed;

    function setAllowed(address payee, bool allowed) public {
        _allowed[payee] = allowed;
    }

    function withdrawalAllowed(address payee) public view override returns (bool) {
        return _allowed[payee];
    }

    uint256[49] private __gap;
}
