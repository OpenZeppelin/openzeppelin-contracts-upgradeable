// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "../GSN/GSNRecipientUpgradeSafe.sol";
import "../GSN/GSNRecipientERC20FeeUpgradeSafe.sol";
import "../proxy/Initializable.sol";

contract GSNRecipientERC20FeeMockUpgradeSafe is Initializable, GSNRecipientUpgradeSafe, GSNRecipientERC20FeeUpgradeSafe {
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
