// SPDX-License-Identifier: MIT

pragma solidity ^0.7.0;

import "../GSN/GSNRecipientUpgradeable.sol";
import "../GSN/GSNRecipientERC20FeeUpgradeable.sol";
import "../proxy/Initializable.sol";

contract GSNRecipientERC20FeeMockUpgradeable is Initializable, GSNRecipientUpgradeable, GSNRecipientERC20FeeUpgradeable {
    function __GSNRecipientERC20FeeMock_init(string memory name, string memory symbol) internal initializer {
        __Context_init_unchained();
        __GSNRecipient_init_unchained();
        __GSNRecipientERC20Fee_init_unchained(name, symbol);
        __GSNRecipientERC20FeeMock_init_unchained(name, symbol);
    }

    function __GSNRecipientERC20FeeMock_init_unchained(string memory name, string memory symbol) internal initializer { }

    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    event MockFunctionCalled(uint256 senderBalance);

    function mockFunction() public {
        emit MockFunctionCalled(token().balanceOf(_msgSender()));
    }
    uint256[50] private __gap;
}
