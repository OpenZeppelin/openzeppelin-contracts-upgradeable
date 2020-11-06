// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../token/ERC20/ERC20SnapshotUpgradeSafe.sol";
import "../Initializable.sol";


contract ERC20SnapshotMockUpgradeSafe is __Initializable, ERC20SnapshotUpgradeSafe {
    function __ERC20SnapshotMock_init(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) internal __initializer {
        __Context_init_unchained();
        __ERC20_init_unchained(name, symbol);
        __ERC20Snapshot_init_unchained();
        __ERC20SnapshotMock_init_unchained(name, symbol, initialAccount, initialBalance);
    }

    function __ERC20SnapshotMock_init_unchained(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) internal __initializer {
        _mint(initialAccount, initialBalance);
    }

    function snapshot() public {
        _snapshot();
    }

    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public {
        _burn(account, amount);
    }
}
