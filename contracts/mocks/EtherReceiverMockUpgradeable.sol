// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "../proxy/utils/Initializable.sol";

contract EtherReceiverMockUpgradeable is Initializable {
    function __EtherReceiverMock_init() internal initializer {
        __EtherReceiverMock_init_unchained();
    }

    function __EtherReceiverMock_init_unchained() internal initializer {
    }
    bool private _acceptEther;

    function setAcceptEther(bool acceptEther) public {
        _acceptEther = acceptEther;
    }

    receive() external payable {
        if (!_acceptEther) {
            revert();
        }
    }
    uint256[49] private __gap;
}
