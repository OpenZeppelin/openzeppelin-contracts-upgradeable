// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./IERC1155Receiver.sol";
import "../../introspection/ERC165.sol";
import "../../Initializable.sol";

/**
 * @dev _Available since v3.1._
 */
abstract contract ERC1155ReceiverUpgradeSafe is Initializable, ERC165UpgradeSafe, IERC1155Receiver {

    function __ERC1155Receiver_init() internal initializer {
        __ERC165_init_unchained();
        __ERC1155Receiver_init_unchained();
    }

    function __ERC1155Receiver_init_unchained() internal initializer {


        _registerInterface(
            IERC1155Receiver(0).onERC1155Received.selector ^
            IERC1155Receiver(0).onERC1155BatchReceived.selector
        );

    }


    uint256[50] private __gap;
}
