pragma solidity ^0.6.0;
import "../Initializable.sol";

contract EtherReceiverMockUpgradeSafe is Initializable {
    constructor() public  {
        __EtherReceiverMock_init();
    }

    function __EtherReceiverMock_init() internal initializer {
        __EtherReceiverMock_init_unchained();
    }

    function __EtherReceiverMock_init_unchained() internal initializer {


    }

    bool private _acceptEther;

    function setAcceptEther(bool acceptEther) public {
        _acceptEther = acceptEther;
    }

    receive () external payable {
        if (!_acceptEther) {
            revert();
        }
    }

    uint256[49] private __gap;
}
