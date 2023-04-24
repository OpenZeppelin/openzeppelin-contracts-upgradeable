// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./token/ERC20MulticallMockUpgradeable.sol";
import "../proxy/utils/Initializable.sol";

contract MulticallTestUpgradeable is Initializable {
    function __MulticallTest_init() internal onlyInitializing {
    }

    function __MulticallTest_init_unchained() internal onlyInitializing {
    }
    function checkReturnValues(
        ERC20MulticallMockUpgradeable multicallToken,
        address[] calldata recipients,
        uint256[] calldata amounts
    ) external {
        uint256 recipientsLen = recipients.length;
        bytes[] memory calls = new bytes[](recipientsLen);
        for (uint256 i = 0; i < recipientsLen; i++) {
            calls[i] = abi.encodeWithSignature("transfer(address,uint256)", recipients[i], amounts[i]);
        }

        bytes[] memory results = multicallToken.multicall(calls);
        uint256 resultsLen = results.length;
        for (uint256 i = 0; i < resultsLen; i++) {
            require(abi.decode(results[i], (bool)));
        }
    }

    /**
     * @dev This empty reserved space is put in place to allow future versions to add new
     * variables without shifting down storage in the inheritance chain.
     * See https://docs.openzeppelin.com/contracts/4.x/upgradeable#storage_gaps
     */
    uint256[50] private __gap;
}
