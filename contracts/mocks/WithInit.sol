// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../access/AccessControlUpgradeable.sol";

contract AccessControlUpgradeableWithInit is AccessControlUpgradeable {
    constructor() payable initializer {
        __AccessControl_init();
    }
}
import "../access/AccessControlDefaultAdminRulesUpgradeable.sol";

contract AccessControlDefaultAdminRulesUpgradeableWithInit is AccessControlDefaultAdminRulesUpgradeable {
    constructor(uint48 initialDelay, address initialDefaultAdmin) payable initializer {
        __AccessControlDefaultAdminRules_init(initialDelay, initialDefaultAdmin);
    }
}
import "../access/AccessControlEnumerableUpgradeable.sol";

contract AccessControlEnumerableUpgradeableWithInit is AccessControlEnumerableUpgradeable {
    constructor() payable initializer {
        __AccessControlEnumerable_init();
    }
}
import "../access/OwnableUpgradeable.sol";

contract OwnableUpgradeableWithInit is OwnableUpgradeable {
    constructor() payable initializer {
        __Ownable_init();
    }
}
import "../access/Ownable2StepUpgradeable.sol";

contract Ownable2StepUpgradeableWithInit is Ownable2StepUpgradeable {
    constructor() payable initializer {
        __Ownable2Step_init();
    }
}
import "../crosschain/amb/CrossChainEnabledAMBUpgradeable.sol";

contract CrossChainEnabledAMBUpgradeableWithInit is CrossChainEnabledAMBUpgradeable {
    constructor(address bridge) CrossChainEnabledAMBUpgradeable(bridge) payable initializer {

    }
}
import "../crosschain/arbitrum/CrossChainEnabledArbitrumL1Upgradeable.sol";

contract CrossChainEnabledArbitrumL1UpgradeableWithInit is CrossChainEnabledArbitrumL1Upgradeable {
    constructor(address bridge) CrossChainEnabledArbitrumL1Upgradeable(bridge) payable initializer {

    }
}
import "../crosschain/arbitrum/CrossChainEnabledArbitrumL2Upgradeable.sol";

contract CrossChainEnabledArbitrumL2UpgradeableWithInit is CrossChainEnabledArbitrumL2Upgradeable {
    constructor() payable initializer {
        __CrossChainEnabledArbitrumL2_init();
    }
}
import "../crosschain/optimism/CrossChainEnabledOptimismUpgradeable.sol";

contract CrossChainEnabledOptimismUpgradeableWithInit is CrossChainEnabledOptimismUpgradeable {
    constructor(address messenger) CrossChainEnabledOptimismUpgradeable(messenger) payable initializer {

    }
}
import "../crosschain/polygon/CrossChainEnabledPolygonChildUpgradeable.sol";

contract CrossChainEnabledPolygonChildUpgradeableWithInit is CrossChainEnabledPolygonChildUpgradeable {
    constructor(address fxChild) CrossChainEnabledPolygonChildUpgradeable(fxChild) payable initializer {

    }
}
import "../finance/PaymentSplitterUpgradeable.sol";

contract PaymentSplitterUpgradeableWithInit is PaymentSplitterUpgradeable {
    constructor(address[] memory payees, uint256[] memory shares_) payable initializer {
        __PaymentSplitter_init(payees, shares_);
    }
}
import "../finance/VestingWalletUpgradeable.sol";

contract VestingWalletUpgradeableWithInit is VestingWalletUpgradeable {
    constructor(address beneficiaryAddress, uint64 startTimestamp, uint64 durationSeconds) payable initializer {
        __VestingWallet_init(beneficiaryAddress, startTimestamp, durationSeconds);
    }
}
import "../governance/TimelockControllerUpgradeable.sol";

contract TimelockControllerUpgradeableWithInit is TimelockControllerUpgradeable {
    constructor(uint256 minDelay, address[] memory proposers, address[] memory executors, address admin) payable initializer {
        __TimelockController_init(minDelay, proposers, executors, admin);
    }
}
import "../governance/TimelockControllerWith46MigrationUpgradeable.sol";

contract TimelockControllerWith46MigrationUpgradeableWithInit is TimelockControllerWith46MigrationUpgradeable {
    constructor(
        uint256 minDelay,
        address[] memory proposers,
        address[] memory executors,
        address admin
    ) payable initializer {
        __TimelockControllerWith46Migration_init(minDelay, proposers, executors, admin);
    }
}
import "../metatx/ERC2771ContextUpgradeable.sol";

contract ERC2771ContextUpgradeableWithInit is ERC2771ContextUpgradeable {
    constructor(address trustedForwarder) ERC2771ContextUpgradeable(trustedForwarder) payable initializer {

    }
}
import "../metatx/MinimalForwarderUpgradeable.sol";

contract MinimalForwarderUpgradeableWithInit is MinimalForwarderUpgradeable {
    constructor() payable initializer {
        __MinimalForwarder_init();
    }
}
import "./AccessControlCrossChainMockUpgradeable.sol";

contract AccessControlCrossChainMockUpgradeableWithInit is AccessControlCrossChainMockUpgradeable {
    constructor() payable initializer {
        __AccessControlCrossChainMock_init();
    }
}
import "./ArraysMockUpgradeable.sol";

contract Uint256ArraysMockUpgradeableWithInit is Uint256ArraysMockUpgradeable {
    constructor(uint256[] memory array) payable initializer {
        __Uint256ArraysMock_init(array);
    }
}
import "./ArraysMockUpgradeable.sol";

contract AddressArraysMockUpgradeableWithInit is AddressArraysMockUpgradeable {
    constructor(address[] memory array) payable initializer {
        __AddressArraysMock_init(array);
    }
}
import "./ArraysMockUpgradeable.sol";

contract Bytes32ArraysMockUpgradeableWithInit is Bytes32ArraysMockUpgradeable {
    constructor(bytes32[] memory array) payable initializer {
        __Bytes32ArraysMock_init(array);
    }
}
import "./CallReceiverMockUpgradeable.sol";

contract CallReceiverMockUpgradeableWithInit is CallReceiverMockUpgradeable {
    constructor() payable initializer {
        __CallReceiverMock_init();
    }
}
import "./compound/CompTimelockUpgradeable.sol";

contract CompTimelockUpgradeableWithInit is CompTimelockUpgradeable {
    constructor(address admin_, uint256 delay_) payable initializer {
        __CompTimelock_init(admin_, delay_);
    }
}
import "./ConditionalEscrowMockUpgradeable.sol";

contract ConditionalEscrowMockUpgradeableWithInit is ConditionalEscrowMockUpgradeable {
    constructor() payable initializer {
        __ConditionalEscrowMock_init();
    }
}
import "./ContextMockUpgradeable.sol";

contract ContextMockUpgradeableWithInit is ContextMockUpgradeable {
    constructor() payable initializer {
        __ContextMock_init();
    }
}
import "./ContextMockUpgradeable.sol";

contract ContextMockCallerUpgradeableWithInit is ContextMockCallerUpgradeable {
    constructor() payable initializer {
        __ContextMockCaller_init();
    }
}
import "./crosschain/bridgesUpgradeable.sol";

contract BaseRelayMockUpgradeableWithInit is BaseRelayMockUpgradeable {
    constructor() payable initializer {
        __BaseRelayMock_init();
    }
}
import "./crosschain/bridgesUpgradeable.sol";

contract BridgeAMBMockUpgradeableWithInit is BridgeAMBMockUpgradeable {
    constructor() payable initializer {
        __BridgeAMBMock_init();
    }
}
import "./crosschain/bridgesUpgradeable.sol";

contract BridgeArbitrumL1MockUpgradeableWithInit is BridgeArbitrumL1MockUpgradeable {
    constructor() payable initializer {
        __BridgeArbitrumL1Mock_init();
    }
}
import "./crosschain/bridgesUpgradeable.sol";

contract BridgeArbitrumL1InboxUpgradeableWithInit is BridgeArbitrumL1InboxUpgradeable {
    constructor() payable initializer {
        __BridgeArbitrumL1Inbox_init();
    }
}
import "./crosschain/bridgesUpgradeable.sol";

contract BridgeArbitrumL1OutboxUpgradeableWithInit is BridgeArbitrumL1OutboxUpgradeable {
    constructor() payable initializer {
        __BridgeArbitrumL1Outbox_init();
    }
}
import "./crosschain/bridgesUpgradeable.sol";

contract BridgeArbitrumL2MockUpgradeableWithInit is BridgeArbitrumL2MockUpgradeable {
    constructor() payable initializer {
        __BridgeArbitrumL2Mock_init();
    }
}
import "./crosschain/bridgesUpgradeable.sol";

contract BridgeOptimismMockUpgradeableWithInit is BridgeOptimismMockUpgradeable {
    constructor() payable initializer {
        __BridgeOptimismMock_init();
    }
}
import "./crosschain/bridgesUpgradeable.sol";

contract BridgePolygonChildMockUpgradeableWithInit is BridgePolygonChildMockUpgradeable {
    constructor() payable initializer {
        __BridgePolygonChildMock_init();
    }
}
import "./crosschain/receiversUpgradeable.sol";

contract CrossChainEnabledAMBMockUpgradeableWithInit is CrossChainEnabledAMBMockUpgradeable {
    constructor(address bridge) CrossChainEnabledAMBMockUpgradeable(bridge) payable initializer {

    }
}
import "./crosschain/receiversUpgradeable.sol";

contract CrossChainEnabledArbitrumL1MockUpgradeableWithInit is CrossChainEnabledArbitrumL1MockUpgradeable {
    constructor(address bridge) CrossChainEnabledArbitrumL1MockUpgradeable(bridge) payable initializer {

    }
}
import "./crosschain/receiversUpgradeable.sol";

contract CrossChainEnabledArbitrumL2MockUpgradeableWithInit is CrossChainEnabledArbitrumL2MockUpgradeable {
    constructor() payable initializer {
        __CrossChainEnabledArbitrumL2Mock_init();
    }
}
import "./crosschain/receiversUpgradeable.sol";

contract CrossChainEnabledOptimismMockUpgradeableWithInit is CrossChainEnabledOptimismMockUpgradeable {
    constructor(address bridge) CrossChainEnabledOptimismMockUpgradeable(bridge) payable initializer {

    }
}
import "./crosschain/receiversUpgradeable.sol";

contract CrossChainEnabledPolygonChildMockUpgradeableWithInit is CrossChainEnabledPolygonChildMockUpgradeable {
    constructor(address bridge) CrossChainEnabledPolygonChildMockUpgradeable(bridge) payable initializer {

    }
}
import "./DummyImplementationUpgradeable.sol";

contract DummyImplementationUpgradeableWithInit is DummyImplementationUpgradeable {
    constructor() payable initializer {
        __DummyImplementation_init();
    }
}
import "./DummyImplementationUpgradeable.sol";

contract DummyImplementationV2UpgradeableWithInit is DummyImplementationV2Upgradeable {
    constructor() payable initializer {
        __DummyImplementationV2_init();
    }
}
import "./ERC1271WalletMockUpgradeable.sol";

contract ERC1271WalletMockUpgradeableWithInit is ERC1271WalletMockUpgradeable {
    constructor(address originalOwner) payable initializer {
        __ERC1271WalletMock_init(originalOwner);
    }
}
import "./ERC1271WalletMockUpgradeable.sol";

contract ERC1271MaliciousMockUpgradeableWithInit is ERC1271MaliciousMockUpgradeable {
    constructor() payable initializer {
        __ERC1271MaliciousMock_init();
    }
}
import "./ERC165/ERC165MaliciousDataUpgradeable.sol";

contract ERC165MaliciousDataUpgradeableWithInit is ERC165MaliciousDataUpgradeable {
    constructor() payable initializer {
        __ERC165MaliciousData_init();
    }
}
import "./ERC165/ERC165MissingDataUpgradeable.sol";

contract ERC165MissingDataUpgradeableWithInit is ERC165MissingDataUpgradeable {
    constructor() payable initializer {
        __ERC165MissingData_init();
    }
}
import "./ERC165/ERC165NotSupportedUpgradeable.sol";

contract ERC165NotSupportedUpgradeableWithInit is ERC165NotSupportedUpgradeable {
    constructor() payable initializer {
        __ERC165NotSupported_init();
    }
}
import "./ERC165/ERC165ReturnBombUpgradeable.sol";

contract ERC165ReturnBombMockUpgradeableWithInit is ERC165ReturnBombMockUpgradeable {
    constructor() payable initializer {
        __ERC165ReturnBombMock_init();
    }
}
import "./ERC20MockUpgradeable.sol";

contract ERC20MockUpgradeableWithInit is ERC20MockUpgradeable {
    constructor() payable initializer {
        __ERC20Mock_init();
    }
}
import "./ERC20ReentrantUpgradeable.sol";

contract ERC20ReentrantUpgradeableWithInit is ERC20ReentrantUpgradeable {
    constructor() payable initializer {
        __ERC20Reentrant_init();
    }
}
import "./ERC2771ContextMockUpgradeable.sol";

contract ERC2771ContextMockUpgradeableWithInit is ERC2771ContextMockUpgradeable {
    constructor(address trustedForwarder) ERC2771ContextMockUpgradeable(trustedForwarder) payable initializer {

    }
}
import "./ERC3156FlashBorrowerMockUpgradeable.sol";

contract ERC3156FlashBorrowerMockUpgradeableWithInit is ERC3156FlashBorrowerMockUpgradeable {
    constructor(bool enableReturn, bool enableApprove) payable initializer {
        __ERC3156FlashBorrowerMock_init(enableReturn, enableApprove);
    }
}
import "./ERC4626MockUpgradeable.sol";

contract ERC4626MockUpgradeableWithInit is ERC4626MockUpgradeable {
    constructor(address underlying) payable initializer {
        __ERC4626Mock_init(underlying);
    }
}
import "./EtherReceiverMockUpgradeable.sol";

contract EtherReceiverMockUpgradeableWithInit is EtherReceiverMockUpgradeable {
    constructor() payable initializer {
        __EtherReceiverMock_init();
    }
}
import "./MulticallTestUpgradeable.sol";

contract MulticallTestUpgradeableWithInit is MulticallTestUpgradeable {
    constructor() payable initializer {
        __MulticallTest_init();
    }
}
import "./PausableMockUpgradeable.sol";

contract PausableMockUpgradeableWithInit is PausableMockUpgradeable {
    constructor() payable initializer {
        __PausableMock_init();
    }
}
import "./proxy/BadBeaconUpgradeable.sol";

contract BadBeaconNoImplUpgradeableWithInit is BadBeaconNoImplUpgradeable {
    constructor() payable initializer {
        __BadBeaconNoImpl_init();
    }
}
import "./proxy/BadBeaconUpgradeable.sol";

contract BadBeaconNotContractUpgradeableWithInit is BadBeaconNotContractUpgradeable {
    constructor() payable initializer {
        __BadBeaconNotContract_init();
    }
}
import "./proxy/ClashingImplementationUpgradeable.sol";

contract ClashingImplementationUpgradeableWithInit is ClashingImplementationUpgradeable {
    constructor() payable initializer {
        __ClashingImplementation_init();
    }
}
import "./proxy/UUPSLegacyUpgradeable.sol";

contract UUPSUpgradeableLegacyMockUpgradeableWithInit is UUPSUpgradeableLegacyMockUpgradeable {
    constructor() payable initializer {
        __UUPSUpgradeableLegacyMock_init();
    }
}
import "./proxy/UUPSUpgradeableMockUpgradeable.sol";

contract NonUpgradeableMockUpgradeableWithInit is NonUpgradeableMockUpgradeable {
    constructor() payable initializer {
        __NonUpgradeableMock_init();
    }
}
import "./proxy/UUPSUpgradeableMockUpgradeable.sol";

contract UUPSUpgradeableMockUpgradeableWithInit is UUPSUpgradeableMockUpgradeable {
    constructor() payable initializer {
        __UUPSUpgradeableMock_init();
    }
}
import "./proxy/UUPSUpgradeableMockUpgradeable.sol";

contract UUPSUpgradeableUnsafeMockUpgradeableWithInit is UUPSUpgradeableUnsafeMockUpgradeable {
    constructor() payable initializer {
        __UUPSUpgradeableUnsafeMock_init();
    }
}
import "./PullPaymentMockUpgradeable.sol";

contract PullPaymentMockUpgradeableWithInit is PullPaymentMockUpgradeable {
    constructor() payable initializer {
        __PullPaymentMock_init();
    }
}
import "./ReentrancyAttackUpgradeable.sol";

contract ReentrancyAttackUpgradeableWithInit is ReentrancyAttackUpgradeable {
    constructor() payable initializer {
        __ReentrancyAttack_init();
    }
}
import "./ReentrancyMockUpgradeable.sol";

contract ReentrancyMockUpgradeableWithInit is ReentrancyMockUpgradeable {
    constructor() payable initializer {
        __ReentrancyMock_init();
    }
}
import "./StorageSlotMockUpgradeable.sol";

contract StorageSlotMockUpgradeableWithInit is StorageSlotMockUpgradeable {
    constructor() payable initializer {
        __StorageSlotMock_init();
    }
}
import "./TimelockReentrantUpgradeable.sol";

contract TimelockReentrantUpgradeableWithInit is TimelockReentrantUpgradeable {
    constructor() payable initializer {
        __TimelockReentrant_init();
    }
}
import "./TimersBlockNumberImplUpgradeable.sol";

contract TimersBlockNumberImplUpgradeableWithInit is TimersBlockNumberImplUpgradeable {
    constructor() payable initializer {
        __TimersBlockNumberImpl_init();
    }
}
import "./TimersTimestampImplUpgradeable.sol";

contract TimersTimestampImplUpgradeableWithInit is TimersTimestampImplUpgradeable {
    constructor() payable initializer {
        __TimersTimestampImpl_init();
    }
}
import "./token/ERC1155ReceiverMockUpgradeable.sol";

contract ERC1155ReceiverMockUpgradeableWithInit is ERC1155ReceiverMockUpgradeable {
    constructor(bytes4 recRetval, bool recReverts, bytes4 batRetval, bool batReverts) payable initializer {
        __ERC1155ReceiverMock_init(recRetval, recReverts, batRetval, batReverts);
    }
}
import "./token/ERC20ExcessDecimalsMockUpgradeable.sol";

contract ERC20ExcessDecimalsMockUpgradeableWithInit is ERC20ExcessDecimalsMockUpgradeable {
    constructor() payable initializer {
        __ERC20ExcessDecimalsMock_init();
    }
}
import "./token/ERC721ConsecutiveEnumerableMockUpgradeable.sol";

contract ERC721ConsecutiveEnumerableMockUpgradeableWithInit is ERC721ConsecutiveEnumerableMockUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        address[] memory receivers,
        uint96[] memory amounts
    ) payable initializer {
        __ERC721ConsecutiveEnumerableMock_init(name, symbol, receivers, amounts);
    }
}
import "./token/ERC721ConsecutiveMockUpgradeable.sol";

contract ERC721ConsecutiveMockUpgradeableWithInit is ERC721ConsecutiveMockUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        address[] memory delegates,
        address[] memory receivers,
        uint96[] memory amounts
    ) payable initializer {
        __ERC721ConsecutiveMock_init(name, symbol, delegates, receivers, amounts);
    }
}
import "./token/ERC721ConsecutiveMockUpgradeable.sol";

contract ERC721ConsecutiveNoConstructorMintMockUpgradeableWithInit is ERC721ConsecutiveNoConstructorMintMockUpgradeable {
    constructor(string memory name, string memory symbol) payable initializer {
        __ERC721ConsecutiveNoConstructorMintMock_init(name, symbol);
    }
}
import "./token/ERC721ReceiverMockUpgradeable.sol";

contract ERC721ReceiverMockUpgradeableWithInit is ERC721ReceiverMockUpgradeable {
    constructor(bytes4 retval, Error error) payable initializer {
        __ERC721ReceiverMock_init(retval, error);
    }
}
import "./token/ERC777SenderRecipientMockUpgradeable.sol";

contract ERC777SenderRecipientMockUpgradeableWithInit is ERC777SenderRecipientMockUpgradeable {
    constructor() payable initializer {
        __ERC777SenderRecipientMock_init();
    }
}
import "./wizard/MyGovernor1Upgradeable.sol";

contract MyGovernor1UpgradeableWithInit is MyGovernor1Upgradeable {
    constructor(
        IVotesUpgradeable _token,
        TimelockControllerUpgradeable _timelock
    ) payable initializer {
        __MyGovernor1_init(_token, _timelock);
    }
}
import "./wizard/MyGovernor2Upgradeable.sol";

contract MyGovernor2UpgradeableWithInit is MyGovernor2Upgradeable {
    constructor(
        IVotesUpgradeable _token,
        TimelockControllerUpgradeable _timelock
    ) payable initializer {
        __MyGovernor2_init(_token, _timelock);
    }
}
import "./wizard/MyGovernor3Upgradeable.sol";

contract MyGovernorUpgradeableWithInit is MyGovernorUpgradeable {
    constructor(
        IVotesUpgradeable _token,
        TimelockControllerUpgradeable _timelock
    ) payable initializer {
        __MyGovernor_init(_token, _timelock);
    }
}
import "../proxy/ERC1967/ERC1967UpgradeUpgradeable.sol";

contract ERC1967UpgradeUpgradeableWithInit is ERC1967UpgradeUpgradeable {
    constructor() payable initializer {
        __ERC1967Upgrade_init();
    }
}
import "../security/PausableUpgradeable.sol";

contract PausableUpgradeableWithInit is PausableUpgradeable {
    constructor() payable initializer {
        __Pausable_init();
    }
}
import "../security/PullPaymentUpgradeable.sol";

contract PullPaymentUpgradeableWithInit is PullPaymentUpgradeable {
    constructor() payable initializer {
        __PullPayment_init();
    }
}
import "../security/ReentrancyGuardUpgradeable.sol";

contract ReentrancyGuardUpgradeableWithInit is ReentrancyGuardUpgradeable {
    constructor() payable initializer {
        __ReentrancyGuard_init();
    }
}
import "../token/common/ERC2981Upgradeable.sol";

contract ERC2981UpgradeableWithInit is ERC2981Upgradeable {
    constructor() payable initializer {
        __ERC2981_init();
    }
}
import "../token/ERC1155/ERC1155Upgradeable.sol";

contract ERC1155UpgradeableWithInit is ERC1155Upgradeable {
    constructor(string memory uri_) payable initializer {
        __ERC1155_init(uri_);
    }
}
import "../token/ERC1155/presets/ERC1155PresetMinterPauserUpgradeable.sol";

contract ERC1155PresetMinterPauserUpgradeableWithInit is ERC1155PresetMinterPauserUpgradeable {
    constructor(string memory uri) payable initializer {
        __ERC1155PresetMinterPauser_init(uri);
    }
}
import "../token/ERC1155/utils/ERC1155HolderUpgradeable.sol";

contract ERC1155HolderUpgradeableWithInit is ERC1155HolderUpgradeable {
    constructor() payable initializer {
        __ERC1155Holder_init();
    }
}
import "../token/ERC20/ERC20Upgradeable.sol";

contract ERC20UpgradeableWithInit is ERC20Upgradeable {
    constructor(string memory name_, string memory symbol_) payable initializer {
        __ERC20_init(name_, symbol_);
    }
}
import "../token/ERC20/presets/ERC20PresetFixedSupplyUpgradeable.sol";

contract ERC20PresetFixedSupplyUpgradeableWithInit is ERC20PresetFixedSupplyUpgradeable {
    constructor(string memory name, string memory symbol, uint256 initialSupply, address owner) payable initializer {
        __ERC20PresetFixedSupply_init(name, symbol, initialSupply, owner);
    }
}
import "../token/ERC20/presets/ERC20PresetMinterPauserUpgradeable.sol";

contract ERC20PresetMinterPauserUpgradeableWithInit is ERC20PresetMinterPauserUpgradeable {
    constructor(string memory name, string memory symbol) payable initializer {
        __ERC20PresetMinterPauser_init(name, symbol);
    }
}
import "../token/ERC20/utils/TokenTimelockUpgradeable.sol";

contract TokenTimelockUpgradeableWithInit is TokenTimelockUpgradeable {
    constructor(IERC20Upgradeable token_, address beneficiary_, uint256 releaseTime_) payable initializer {
        __TokenTimelock_init(token_, beneficiary_, releaseTime_);
    }
}
import "../token/ERC721/ERC721Upgradeable.sol";

contract ERC721UpgradeableWithInit is ERC721Upgradeable {
    constructor(string memory name_, string memory symbol_) payable initializer {
        __ERC721_init(name_, symbol_);
    }
}
import "../token/ERC721/presets/ERC721PresetMinterPauserAutoIdUpgradeable.sol";

contract ERC721PresetMinterPauserAutoIdUpgradeableWithInit is ERC721PresetMinterPauserAutoIdUpgradeable {
    constructor(string memory name, string memory symbol, string memory baseTokenURI) payable initializer {
        __ERC721PresetMinterPauserAutoId_init(name, symbol, baseTokenURI);
    }
}
import "../token/ERC721/utils/ERC721HolderUpgradeable.sol";

contract ERC721HolderUpgradeableWithInit is ERC721HolderUpgradeable {
    constructor() payable initializer {
        __ERC721Holder_init();
    }
}
import "../token/ERC777/ERC777Upgradeable.sol";

contract ERC777UpgradeableWithInit is ERC777Upgradeable {
    constructor(string memory name_, string memory symbol_, address[] memory defaultOperators_) payable initializer {
        __ERC777_init(name_, symbol_, defaultOperators_);
    }
}
import "../token/ERC777/presets/ERC777PresetFixedSupplyUpgradeable.sol";

contract ERC777PresetFixedSupplyUpgradeableWithInit is ERC777PresetFixedSupplyUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        address[] memory defaultOperators,
        uint256 initialSupply,
        address owner
    ) payable initializer {
        __ERC777PresetFixedSupply_init(name, symbol, defaultOperators, initialSupply, owner);
    }
}
import "../utils/ContextUpgradeable.sol";

contract ContextUpgradeableWithInit is ContextUpgradeable {
    constructor() payable initializer {
        __Context_init();
    }
}
import "../utils/cryptography/EIP712Upgradeable.sol";

contract EIP712UpgradeableWithInit is EIP712Upgradeable {
    constructor(string memory name, string memory version) payable initializer {
        __EIP712_init(name, version);
    }
}
import "../utils/escrow/EscrowUpgradeable.sol";

contract EscrowUpgradeableWithInit is EscrowUpgradeable {
    constructor() payable initializer {
        __Escrow_init();
    }
}
import "../utils/escrow/RefundEscrowUpgradeable.sol";

contract RefundEscrowUpgradeableWithInit is RefundEscrowUpgradeable {
    constructor(address payable beneficiary_) payable initializer {
        __RefundEscrow_init(beneficiary_);
    }
}
import "../utils/introspection/ERC165Upgradeable.sol";

contract ERC165UpgradeableWithInit is ERC165Upgradeable {
    constructor() payable initializer {
        __ERC165_init();
    }
}
import "../utils/introspection/ERC165StorageUpgradeable.sol";

contract ERC165StorageUpgradeableWithInit is ERC165StorageUpgradeable {
    constructor() payable initializer {
        __ERC165Storage_init();
    }
}
import "../utils/introspection/ERC1820ImplementerUpgradeable.sol";

contract ERC1820ImplementerUpgradeableWithInit is ERC1820ImplementerUpgradeable {
    constructor() payable initializer {
        __ERC1820Implementer_init();
    }
}
import "../utils/MulticallUpgradeable.sol";

contract MulticallUpgradeableWithInit is MulticallUpgradeable {
    constructor() payable initializer {
        __Multicall_init();
    }
}
