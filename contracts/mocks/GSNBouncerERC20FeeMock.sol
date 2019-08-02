pragma solidity ^0.5.0;

import "@openzeppelin/upgrades/contracts/Initializable.sol";
import "../GSN/GSNRecipient.sol";
import "../GSN/bouncers/GSNBouncerERC20Fee.sol";

contract GSNBouncerERC20FeeMock is Initializable, GSNRecipient, GSNBouncerERC20Fee {
    function initialize(string memory name, string memory symbol, uint8 decimals) initializer public {
        GSNBouncerERC20Fee.initialize(name, symbol, decimals);
        GSNRecipient.initialize();
    }

    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }

    event MockFunctionCalled(uint256 senderBalance);

    function mockFunction() public {
        emit MockFunctionCalled(token().balanceOf(_msgSender()));
    }
}
