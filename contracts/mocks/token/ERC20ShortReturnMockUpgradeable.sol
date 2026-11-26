// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import {ERC20Upgradeable} from "../../token/ERC20/ERC20Upgradeable.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

abstract contract ERC20ShortReturnMockUpgradeable is Initializable, ERC20Upgradeable {
    error NotShortReturn();

    uint256 internal _zeroCount;

    function __ERC20ShortReturnMock_init(uint256 zeroCount) internal onlyInitializing {
        __ERC20ShortReturnMock_init_unchained(zeroCount);
    }

    function __ERC20ShortReturnMock_init_unchained(uint256 zeroCount) internal onlyInitializing {
        require(zeroCount < 32, NotShortReturn());
        _zeroCount = zeroCount;
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        super.transfer(to, amount);

        uint256 returndatalength = _zeroCount;
        assembly ("memory-safe") {
            mstore(0, 0)
            return(0, returndatalength)
        }
    }

    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        super.transferFrom(from, to, amount);

        uint256 returndatalength = _zeroCount;
        assembly ("memory-safe") {
            mstore(0, 0)
            return(0, returndatalength)
        }
    }

    function approve(address spender, uint256 allowance) public override returns (bool) {
        super.approve(spender, allowance);

        uint256 returndatalength = _zeroCount;
        assembly ("memory-safe") {
            mstore(0, 0)
            return(0, returndatalength)
        }
    }
}
