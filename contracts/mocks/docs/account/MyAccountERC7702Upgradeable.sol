// contracts/MyAccountERC7702.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Account} from "@openzeppelin/contracts/account/Account.sol";
import {ERC721HolderUpgradeable} from "../../../token/ERC721/utils/ERC721HolderUpgradeable.sol";
import {ERC1155HolderUpgradeable} from "../../../token/ERC1155/utils/ERC1155HolderUpgradeable.sol";
import {ERC7821} from "@openzeppelin/contracts/account/extensions/draft-ERC7821.sol";
import {SignerERC7702} from "@openzeppelin/contracts/utils/cryptography/signers/SignerERC7702.sol";
import {Initializable} from "../../../proxy/utils/Initializable.sol";

contract MyAccountERC7702Upgradeable is Initializable, Account, SignerERC7702, ERC7821, ERC721HolderUpgradeable, ERC1155HolderUpgradeable {
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
