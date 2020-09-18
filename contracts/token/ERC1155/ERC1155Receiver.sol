// SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

import "@openzeppelin/upgrades/contracts/Initializable.sol";

import "./IERC1155Receiver.sol";
import "../../introspection/ERC165.sol";

/**
 * @dev _Available since v3.1._
 */
contract ERC1155Receiver is Initializable, ERC165, IERC1155Receiver {
    function initialize() public initializer {
        ERC165.initialize();

        _registerInterface(
            ERC1155Receiver(0).onERC1155Received.selector ^
            ERC1155Receiver(0).onERC1155BatchReceived.selector
        );
    }
}
