// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ERC1363Upgradeable} from "../../token/ERC20/extensions/ERC1363Upgradeable.sol";
import {Initializable} from "../../proxy/utils/Initializable.sol";

// contract that replicate USDT approval behavior in approveAndCall
abstract contract ERC1363ForceApproveMockUpgradeable is Initializable, ERC1363Upgradeable {
    function __ERC1363ForceApproveMock_init() internal onlyInitializing {
    }

    function __ERC1363ForceApproveMock_init_unchained() internal onlyInitializing {
    }
    function approveAndCall(address spender, uint256 amount, bytes memory data) public virtual override returns (bool) {
        require(amount == 0 || allowance(msg.sender, spender) == 0, "USDT approval failure");
        return super.approveAndCall(spender, amount, data);
    }
}
