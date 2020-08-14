pragma solidity ^0.6.0;

import "../token/ERC20/ERC20Burnable.sol";
import "../Initializable.sol";

contract ERC20BurnableMockUpgradeSafe is Initializable, ERC20BurnableUpgradeSafe {

    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public  {
        __ERC20BurnableMock_init(name, symbol, initialAccount, initialBalance);
    }

    function __ERC20BurnableMock_init(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) internal initializer {
        __Context_init_unchained();
        __ERC20_init_unchained(name, symbol);
        __ERC20Burnable_init_unchained();
        __ERC20BurnableMock_init_unchained(initialAccount, initialBalance);
    }

    function __ERC20BurnableMock_init_unchained(
        address initialAccount,
        uint256 initialBalance
    ) internal initializer {

        _mint(initialAccount, initialBalance);

    }

    uint256[50] private __gap;
}
