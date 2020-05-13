pragma solidity ^0.6.0;

import "./IERC721Receiver.sol";
import "../../Initializable.sol";

contract ERC721HolderUpgradeSafe is Initializable, IERC721Receiver {
    function __ERC721Holder_init() internal initializer {
        __ERC721Holder_init_unchained();
    }

    function __ERC721Holder_init_unchained() internal initializer {


    }

    function onERC721Received(address, address, uint256, bytes memory) public virtual override returns (bytes4) {
        return this.onERC721Received.selector;
    }

    uint256[50] private __gap;
}
