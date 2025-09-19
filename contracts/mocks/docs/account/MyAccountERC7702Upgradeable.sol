// contracts/MyAccountERC7702.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Account} from "@openzeppelin/contracts/account/Account.sol";
import {ERC721Holder} from "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import {ERC1155Holder} from "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Holder.sol";
import {ERC7821} from "@openzeppelin/contracts/account/extensions/draft-ERC7821.sol";
import {SignerEIP7702} from "@openzeppelin/contracts/utils/cryptography/signers/SignerEIP7702.sol";
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract MyAccountERC7702Upgradeable is Initializable, Account, SignerEIP7702, ERC7821, ERC721Holder, ERC1155Holder {
    function __MyAccountERC7702_init() internal onlyInitializing {
    }

    function __MyAccountERC7702_init_unchained() internal onlyInitializing {
    }
    /// @dev Allows the entry point as an authorized executor.
    function _erc7821AuthorizedExecutor(
        address caller,
        bytes32 mode,
        bytes calldata executionData
    ) internal view virtual override returns (bool) {
        return caller == address(entryPoint()) || super._erc7821AuthorizedExecutor(caller, mode, executionData);
    }
}
