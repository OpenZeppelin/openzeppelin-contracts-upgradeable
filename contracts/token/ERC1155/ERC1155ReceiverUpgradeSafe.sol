// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./IERC1155ReceiverUpgradeSafe.sol";
import "../../introspection/ERC165UpgradeSafe.sol";
import "../../Initializable.sol";

/**
 * @dev _Available since v3.1._
 */
abstract contract ERC1155ReceiverUpgradeSafe is __Initializable, ERC165UpgradeSafe, IERC1155ReceiverUpgradeSafe {
    function __ERC1155Receiver_init() internal __initializer {
        __ERC165_init_unchained();
        __ERC1155Receiver_init_unchained();
    }

    function __ERC1155Receiver_init_unchained() internal __initializer {
        _registerInterface(
            ERC1155ReceiverUpgradeSafe(0).onERC1155Received.selector ^
            ERC1155ReceiverUpgradeSafe(0).onERC1155BatchReceived.selector
        );
    }
}
