// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract ConstructorMockUpgradeable is Initializable {
    bool foo;

    enum RevertType {
        None,
        RevertWithoutMessage,
        RevertWithMessage,
        RevertWithCustomError,
        Panic
    }

    error CustomError();

    function __ConstructorMock_init(RevertType err) internal onlyInitializing {
        __ConstructorMock_init_unchained(err);
    }

    function __ConstructorMock_init_unchained(RevertType err) internal onlyInitializing {
        // After transpilation to upgradeable contract, the constructor will become an initializer
        // To silence the `... can be restricted to view` warning, we write to state
        foo = true;

        if (err == RevertType.RevertWithoutMessage) {
            revert();
        } else if (err == RevertType.RevertWithMessage) {
            revert("ConstructorMock: reverting");
        } else if (err == RevertType.RevertWithCustomError) {
            revert CustomError();
        } else if (err == RevertType.Panic) {
            uint256 a = uint256(0) / uint256(0);
            a;
        }
    }
}
