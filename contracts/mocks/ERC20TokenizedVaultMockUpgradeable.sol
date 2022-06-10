// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../token/ERC20/extensions/ERC20TokenizedVaultUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

// mock class using ERC20
contract ERC20TokenizedVaultMockUpgradeable is Initializable, ERC20TokenizedVaultUpgradeable {
    function __ERC20TokenizedVaultMock_init(
        IERC20MetadataUpgradeable asset,
        string memory name,
        string memory symbol
    ) internal onlyInitializing {
        __ERC20_init_unchained(name, symbol);
        __ERC20TokenizedVault_init_unchained(asset);
    }

    function __ERC20TokenizedVaultMock_init_unchained(
        IERC20MetadataUpgradeable,
        string memory,
        string memory
    ) internal onlyInitializing {}

    function mockMint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    function mockBurn(address account, uint256 amount) public {
        _burn(account, amount);
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
