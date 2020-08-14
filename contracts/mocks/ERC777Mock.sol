pragma solidity ^0.6.0;

import "../GSN/Context.sol";
import "../token/ERC777/ERC777.sol";
import "../Initializable.sol";

contract ERC777MockUpgradeSafe is Initializable, ContextUpgradeSafe, ERC777UpgradeSafe {

    constructor(
        address initialHolder,
        uint256 initialBalance,
        string memory name,
        string memory symbol,
        address[] memory defaultOperators
    ) public  {
        __ERC777Mock_init(initialHolder, initialBalance, name, symbol, defaultOperators);
    }

    function __ERC777Mock_init(
        address initialHolder,
        uint256 initialBalance,
        string memory name,
        string memory symbol,
        address[] memory defaultOperators
    ) internal initializer {
        __Context_init_unchained();
        __ERC777_init_unchained(name, symbol, defaultOperators);
        __ERC777Mock_init_unchained(initialHolder, initialBalance);
    }

    function __ERC777Mock_init_unchained(
        address initialHolder,
        uint256 initialBalance
    ) internal initializer {

        _mint(initialHolder, initialBalance, "", "");

    }

    function mintInternal (
        address to,
        uint256 amount,
        bytes memory userData,
        bytes memory operatorData
    ) public {
        _mint(to, amount, userData, operatorData);
    }

    uint256[50] private __gap;
}
