// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC1155MockUpgradeable.sol";
import "../token/ERC1155/extensions/ERC1155SupplyUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract ERC1155SupplyMockUpgradeable is Initializable, ERC1155MockUpgradeable, ERC1155SupplyUpgradeable {
    function __ERC1155SupplyMock_init(string memory uri) internal initializer {
        __Context_init_unchained();
        __ERC165_init_unchained();
        __ERC1155_init_unchained(uri);
        __ERC1155Mock_init_unchained(uri);
        __ERC1155Supply_init_unchained();
        __ERC1155SupplyMock_init_unchained(uri);
    }

    function __ERC1155SupplyMock_init_unchained(string memory uri) internal initializer {}

    function _mint(
        address account,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) internal virtual override(ERC1155Upgradeable, ERC1155SupplyUpgradeable) {
        super._mint(account, id, amount, data);
    }

    function _mintBatch(
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    ) internal virtual override(ERC1155Upgradeable, ERC1155SupplyUpgradeable) {
        super._mintBatch(to, ids, amounts, data);
    }

    function _burn(
        address account,
        uint256 id,
        uint256 amount
    ) internal virtual override(ERC1155Upgradeable, ERC1155SupplyUpgradeable) {
        super._burn(account, id, amount);
    }

    function _burnBatch(
        address account,
        uint256[] memory ids,
        uint256[] memory amounts
    ) internal virtual override(ERC1155Upgradeable, ERC1155SupplyUpgradeable) {
        super._burnBatch(account, ids, amounts);
    }
    uint256[50] private __gap;
}
