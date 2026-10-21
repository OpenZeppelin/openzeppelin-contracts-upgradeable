// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract EtherReceiverMockUpgradeable is Initializable {
    bool private _acceptEther;

    error EtherReceiveRejected();

    function __EtherReceiverMock_init() internal onlyInitializing {
    }

    function __EtherReceiverMock_init_unchained() internal onlyInitializing {
    }
    function setAcceptEther(bool acceptEther) public {
        _acceptEther = acceptEther;
    }

    receive() external payable {
        require(_acceptEther, EtherReceiveRejected());
    }
}
