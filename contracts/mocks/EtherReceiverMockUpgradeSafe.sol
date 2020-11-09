// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
import "../Initializable.sol";

contract EtherReceiverMockUpgradeSafe is __Initializable {
    function __EtherReceiverMock_init() internal __initializer {
        __EtherReceiverMock_init_unchained();
    }

    function __EtherReceiverMock_init_unchained() internal __initializer {
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
