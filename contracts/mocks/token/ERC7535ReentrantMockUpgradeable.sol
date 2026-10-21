// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {IERC4626} from "@openzeppelin/contracts/interfaces/IERC4626.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract ERC7535ReentrantMockUpgradeable is Initializable {
    event ObservedOnReceive(uint256 totalAssets, uint256 totalSupply, uint256 value);

    function __ERC7535ReentrantMock_init() internal onlyInitializing {
    }

    function __ERC7535ReentrantMock_init_unchained() internal onlyInitializing {
    }
    function mint(IERC4626 vault, uint256 shares) public payable {
        vault.mint{value: msg.value}(shares, address(this));
    }

    function redeem(IERC4626 vault, uint256 shares) public {
        vault.redeem(shares, address(this), address(this));
    }

    // Records the price of one share, as seen from a reentrant call while the vault sends native asset.
    receive() external payable {
        IERC4626 vault = IERC4626(msg.sender);
        emit ObservedOnReceive(vault.totalAssets(), vault.totalSupply(), msg.value);
    }
}
