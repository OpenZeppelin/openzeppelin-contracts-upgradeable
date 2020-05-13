pragma solidity ^0.6.0;

import "./ContextMock.sol";
import "../GSN/GSNRecipient.sol";
import "../Initializable.sol";

// By inheriting from GSNRecipient, Context's internal functions are overridden automatically
contract GSNRecipientMockUpgradeSafe is Initializable, ContextMockUpgradeSafe, GSNRecipientUpgradeSafe {
    constructor() public  {
        __GSNRecipientMock_init();
    }

    function __GSNRecipientMock_init() internal initializer {
        __Context_init_unchained();
        __ContextMock_init_unchained();
        __GSNRecipient_init_unchained();
        __GSNRecipientMock_init_unchained();
    }

    function __GSNRecipientMock_init_unchained() internal initializer {


    }

    function withdrawDeposits(uint256 amount, address payable payee) public {
        _withdrawDeposits(amount, payee);
    }

    function acceptRelayedCall(address, address, bytes calldata, uint256, uint256, uint256, uint256, bytes calldata, uint256)
        external
        view
        override
        returns (uint256, bytes memory)
    {
        return (0, "");
    }

    function _preRelayedCall(bytes memory) internal override returns (bytes32) { }

    function _postRelayedCall(bytes memory, bool, uint256, bytes32) internal override { }

    function upgradeRelayHub(address newRelayHub) public {
        return _upgradeRelayHub(newRelayHub);
    }

    function _msgSender() internal override(ContextUpgradeSafe, GSNRecipientUpgradeSafe) view virtual returns (address payable) {
        return GSNRecipientUpgradeSafe._msgSender();
    }

    function _msgData() internal override(ContextUpgradeSafe, GSNRecipientUpgradeSafe) view virtual returns (bytes memory) {
        return GSNRecipientUpgradeSafe._msgData();
    }

    uint256[50] private __gap;
}
