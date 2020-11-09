// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./IERC721ReceiverUpgradeSafe.sol";
import "../../Initializable.sol";

  /**
   * @dev Implementation of the {IERC721Receiver} interface.
   *
   * Accepts all token transfers. 
   * Make sure the contract is able to use its token with {IERC721-safeTransferFrom}, {IERC721-approve} or {IERC721-setApprovalForAll}.
   */
contract ERC721HolderUpgradeSafe is __Initializable, IERC721ReceiverUpgradeSafe {
    function __ERC721Holder_init() internal __initializer {
        __ERC721Holder_init_unchained();
    }

    function __ERC721Holder_init_unchained() internal __initializer {
    }

    /**
     * @dev See {IERC721Receiver-onERC721Received}.
     *
     * Always returns `IERC721Receiver.onERC721Received.selector`.
     */
    function onERC721Received(address, address, uint256, bytes memory) public virtual override returns (bytes4) {
        return this.onERC721Received.selector;
    }
    uint256[50] private __gap;
}
