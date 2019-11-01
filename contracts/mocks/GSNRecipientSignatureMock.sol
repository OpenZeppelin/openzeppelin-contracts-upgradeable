pragma solidity ^0.5.0;

import "../GSN/GSNRecipient.sol";
import "../GSN/GSNRecipientSignature.sol";

contract GSNRecipientSignatureMock is GSNRecipient, GSNRecipientSignature {
    constructor(address trustedSigner) public {
        GSNRecipientSignature.initialize(trustedSigner);
    }

    event MockFunctionCalled();

    function mockFunction() public {
        emit MockFunctionCalled();
    }
}
