// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ERC1363Upgradeable} from "../../token/ERC20/extensions/ERC1363Upgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC1363NoReturnMockUpgradeable is Initializable, ERC1363Upgradeable {
    function __ERC1363NoReturnMock_init() internal onlyInitializing {
    }

    function __ERC1363NoReturnMock_init_unchained() internal onlyInitializing {
    }
    function transferAndCall(address to, uint256 value, bytes memory data) public override returns (bool) {
        super.transferAndCall(to, value, data);
        assembly {
            return(0, 0)
        }
    }

    function transferFromAndCall(
        address from,
        address to,
        uint256 value,
        bytes memory data
    ) public override returns (bool) {
        super.transferFromAndCall(from, to, value, data);
        assembly {
            return(0, 0)
        }
    }

    function approveAndCall(address spender, uint256 value, bytes memory data) public override returns (bool) {
        super.approveAndCall(spender, value, data);
        assembly {
            return(0, 0)
        }
    }
}
