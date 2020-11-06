pragma solidity ^0.6;
pragma experimental ABIEncoderV2;

import "./access/OwnableUpgradeSafe.sol";

contract OwnableUpgradeSafeWithInit is OwnableUpgradeSafe {
    constructor() public payable {
        __Ownable_init();
    }
}
import "./access/TimelockControllerUpgradeSafe.sol";

contract TimelockControllerUpgradeSafeWithInit is TimelockControllerUpgradeSafe {
    constructor(uint256 minDelay, address[] memory proposers, address[] memory executors) public payable {
        __TimelockController_init(minDelay, proposers, executors);
    }
}
import "./GSN/GSNRecipientERC20FeeUpgradeSafe.sol";

contract GSNRecipientERC20FeeUpgradeSafeWithInit is GSNRecipientERC20FeeUpgradeSafe {
    constructor(string memory name, string memory symbol) public payable {
        __GSNRecipientERC20Fee_init(name, symbol);
    }
}
import "./GSN/GSNRecipientERC20FeeUpgradeSafe.sol";

contract __unstable__ERC20OwnedUpgradeSafeWithInit is __unstable__ERC20OwnedUpgradeSafe {
    constructor(string memory name, string memory symbol) public payable {
        ____unstable__ERC20Owned_init(name, symbol);
    }
}
import "./token/ERC20/ERC20UpgradeSafe.sol";

contract ERC20UpgradeSafeWithInit is ERC20UpgradeSafe {
    constructor(string memory name, string memory symbol) public payable {
        __ERC20_init(name, symbol);
    }
}
import "./GSN/GSNRecipientSignatureUpgradeSafe.sol";

contract GSNRecipientSignatureUpgradeSafeWithInit is GSNRecipientSignatureUpgradeSafe {
    constructor(address trustedSigner) public payable {
        __GSNRecipientSignature_init(trustedSigner);
    }
}
import "./introspection/ERC165UpgradeSafe.sol";

contract ERC165UpgradeSafeWithInit is ERC165UpgradeSafe {
    constructor() public payable {
        __ERC165_init();
    }
}
import "./introspection/ERC1820ImplementerUpgradeSafe.sol";

contract ERC1820ImplementerUpgradeSafeWithInit is ERC1820ImplementerUpgradeSafe {
    constructor() public payable {
        __ERC1820Implementer_init();
    }
}
import "./mocks/AccessControlMockUpgradeSafe.sol";

contract AccessControlMockUpgradeSafeWithInit is AccessControlMockUpgradeSafe {
    constructor() public payable {
        __AccessControlMock_init();
    }
}
import "./mocks/AddressImplUpgradeSafe.sol";

contract AddressImplUpgradeSafeWithInit is AddressImplUpgradeSafe {
    constructor() public payable {
        __AddressImpl_init();
    }
}
import "./mocks/ArraysImplUpgradeSafe.sol";

contract ArraysImplUpgradeSafeWithInit is ArraysImplUpgradeSafe {
    constructor(uint256[] memory array) public payable {
        __ArraysImpl_init(array);
    }
}
import "./mocks/CallReceiverMockUpgradeSafe.sol";

contract CallReceiverMockUpgradeSafeWithInit is CallReceiverMockUpgradeSafe {
    constructor() public payable {
        __CallReceiverMock_init();
    }
}
import "./mocks/ClashingImplementationUpgradeSafe.sol";

contract ClashingImplementationUpgradeSafeWithInit is ClashingImplementationUpgradeSafe {
    constructor() public payable {
        __ClashingImplementation_init();
    }
}
import "./mocks/ConditionalEscrowMockUpgradeSafe.sol";

contract ConditionalEscrowMockUpgradeSafeWithInit is ConditionalEscrowMockUpgradeSafe {
    constructor() public payable {
        __ConditionalEscrowMock_init();
    }
}
import "./payment/escrow/EscrowUpgradeSafe.sol";

contract EscrowUpgradeSafeWithInit is EscrowUpgradeSafe {
    constructor() public payable {
        __Escrow_init();
    }
}
import "./mocks/ContextMockUpgradeSafe.sol";

contract ContextMockUpgradeSafeWithInit is ContextMockUpgradeSafe {
    constructor() public payable {
        __ContextMock_init();
    }
}
import "./mocks/ContextMockUpgradeSafe.sol";

contract ContextMockCallerUpgradeSafeWithInit is ContextMockCallerUpgradeSafe {
    constructor() public payable {
        __ContextMockCaller_init();
    }
}
import "./mocks/CountersImplUpgradeSafe.sol";

contract CountersImplUpgradeSafeWithInit is CountersImplUpgradeSafe {
    constructor() public payable {
        __CountersImpl_init();
    }
}
import "./mocks/Create2ImplUpgradeSafe.sol";

contract Create2ImplUpgradeSafeWithInit is Create2ImplUpgradeSafe {
    constructor() public payable {
        __Create2Impl_init();
    }
}
import "./mocks/DummyImplementationUpgradeSafe.sol";

contract DummyImplementationUpgradeSafeWithInit is DummyImplementationUpgradeSafe {
    constructor() public payable {
        __DummyImplementation_init();
    }
}
import "./mocks/DummyImplementationUpgradeSafe.sol";

contract DummyImplementationV2UpgradeSafeWithInit is DummyImplementationV2UpgradeSafe {
    constructor() public payable {
        __DummyImplementationV2_init();
    }
}
import "./mocks/ECDSAMockUpgradeSafe.sol";

contract ECDSAMockUpgradeSafeWithInit is ECDSAMockUpgradeSafe {
    constructor() public payable {
        __ECDSAMock_init();
    }
}
import "./mocks/EnumerableMapMockUpgradeSafe.sol";

contract EnumerableMapMockUpgradeSafeWithInit is EnumerableMapMockUpgradeSafe {
    constructor() public payable {
        __EnumerableMapMock_init();
    }
}
import "./mocks/EnumerableSetMockUpgradeSafe.sol";

contract EnumerableBytes32SetMockUpgradeSafeWithInit is EnumerableBytes32SetMockUpgradeSafe {
    constructor() public payable {
        __EnumerableBytes32SetMock_init();
    }
}
import "./mocks/EnumerableSetMockUpgradeSafe.sol";

contract EnumerableAddressSetMockUpgradeSafeWithInit is EnumerableAddressSetMockUpgradeSafe {
    constructor() public payable {
        __EnumerableAddressSetMock_init();
    }
}
import "./mocks/EnumerableSetMockUpgradeSafe.sol";

contract EnumerableUintSetMockUpgradeSafeWithInit is EnumerableUintSetMockUpgradeSafe {
    constructor() public payable {
        __EnumerableUintSetMock_init();
    }
}
import "./mocks/ERC1155BurnableMockUpgradeSafe.sol";

contract ERC1155BurnableMockUpgradeSafeWithInit is ERC1155BurnableMockUpgradeSafe {
    constructor(string memory uri) public payable {
        __ERC1155BurnableMock_init(uri);
    }
}
import "./token/ERC1155/ERC1155UpgradeSafe.sol";

contract ERC1155UpgradeSafeWithInit is ERC1155UpgradeSafe {
    constructor(string memory uri) public payable {
        __ERC1155_init(uri);
    }
}
import "./mocks/ERC1155MockUpgradeSafe.sol";

contract ERC1155MockUpgradeSafeWithInit is ERC1155MockUpgradeSafe {
    constructor(string memory uri) public payable {
        __ERC1155Mock_init(uri);
    }
}
import "./mocks/ERC1155PausableMockUpgradeSafe.sol";

contract ERC1155PausableMockUpgradeSafeWithInit is ERC1155PausableMockUpgradeSafe {
    constructor(string memory uri) public payable {
        __ERC1155PausableMock_init(uri);
    }
}
import "./utils/PausableUpgradeSafe.sol";

contract PausableUpgradeSafeWithInit is PausableUpgradeSafe {
    constructor() public payable {
        __Pausable_init();
    }
}
import "./mocks/ERC1155ReceiverMockUpgradeSafe.sol";

contract ERC1155ReceiverMockUpgradeSafeWithInit is ERC1155ReceiverMockUpgradeSafe {
    constructor(
        bytes4 recRetval,
        bool recReverts,
        bytes4 batRetval,
        bool batReverts
    ) public payable {
        __ERC1155ReceiverMock_init(recRetval, recReverts, batRetval, batReverts);
    }
}
import "./mocks/ERC165MockUpgradeSafe.sol";

contract ERC165MockUpgradeSafeWithInit is ERC165MockUpgradeSafe {
    constructor() public payable {
        __ERC165Mock_init();
    }
}
import "./mocks/ERC165/ERC165InterfacesSupportedUpgradeSafe.sol";

contract SupportsInterfaceWithLookupMockUpgradeSafeWithInit is SupportsInterfaceWithLookupMockUpgradeSafe {
    constructor() public payable {
        __SupportsInterfaceWithLookupMock_init();
    }
}
import "./mocks/ERC165/ERC165InterfacesSupportedUpgradeSafe.sol";

contract ERC165InterfacesSupportedUpgradeSafeWithInit is ERC165InterfacesSupportedUpgradeSafe {
    constructor(bytes4[] memory interfaceIds) public payable {
        __ERC165InterfacesSupported_init(interfaceIds);
    }
}
import "./mocks/ERC165/ERC165NotSupportedUpgradeSafe.sol";

contract ERC165NotSupportedUpgradeSafeWithInit is ERC165NotSupportedUpgradeSafe {
    constructor() public payable {
        __ERC165NotSupported_init();
    }
}
import "./mocks/ERC165CheckerMockUpgradeSafe.sol";

contract ERC165CheckerMockUpgradeSafeWithInit is ERC165CheckerMockUpgradeSafe {
    constructor() public payable {
        __ERC165CheckerMock_init();
    }
}
import "./mocks/ERC1820ImplementerMockUpgradeSafe.sol";

contract ERC1820ImplementerMockUpgradeSafeWithInit is ERC1820ImplementerMockUpgradeSafe {
    constructor() public payable {
        __ERC1820ImplementerMock_init();
    }
}
import "./mocks/ERC20BurnableMockUpgradeSafe.sol";

contract ERC20BurnableMockUpgradeSafeWithInit is ERC20BurnableMockUpgradeSafe {
    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public payable {
        __ERC20BurnableMock_init(name, symbol, initialAccount, initialBalance);
    }
}
import "./mocks/ERC20CappedMockUpgradeSafe.sol";

contract ERC20CappedMockUpgradeSafeWithInit is ERC20CappedMockUpgradeSafe {
    constructor(string memory name, string memory symbol, uint256 cap) public payable {
        __ERC20CappedMock_init(name, symbol, cap);
    }
}
import "./mocks/ERC20DecimalsMockUpgradeSafe.sol";

contract ERC20DecimalsMockUpgradeSafeWithInit is ERC20DecimalsMockUpgradeSafe {
    constructor(string memory name, string memory symbol, uint8 decimals) public payable {
        __ERC20DecimalsMock_init(name, symbol, decimals);
    }
}
import "./mocks/ERC20MockUpgradeSafe.sol";

contract ERC20MockUpgradeSafeWithInit is ERC20MockUpgradeSafe {
    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public payable {
        __ERC20Mock_init(name, symbol, initialAccount, initialBalance);
    }
}
import "./mocks/ERC20PausableMockUpgradeSafe.sol";

contract ERC20PausableMockUpgradeSafeWithInit is ERC20PausableMockUpgradeSafe {
    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public payable {
        __ERC20PausableMock_init(name, symbol, initialAccount, initialBalance);
    }
}
import "./mocks/ERC20SnapshotMockUpgradeSafe.sol";

contract ERC20SnapshotMockUpgradeSafeWithInit is ERC20SnapshotMockUpgradeSafe {
    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public payable {
        __ERC20SnapshotMock_init(name, symbol, initialAccount, initialBalance);
    }
}
import "./mocks/ERC721BurnableMockUpgradeSafe.sol";

contract ERC721BurnableMockUpgradeSafeWithInit is ERC721BurnableMockUpgradeSafe {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721BurnableMock_init(name, symbol);
    }
}
import "./token/ERC721/ERC721UpgradeSafe.sol";

contract ERC721UpgradeSafeWithInit is ERC721UpgradeSafe {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721_init(name, symbol);
    }
}
import "./mocks/ERC721GSNRecipientMockUpgradeSafe.sol";

contract ERC721GSNRecipientMockUpgradeSafeWithInit is ERC721GSNRecipientMockUpgradeSafe {
    constructor(string memory name, string memory symbol, address trustedSigner) public payable {
        __ERC721GSNRecipientMock_init(name, symbol, trustedSigner);
    }
}
import "./mocks/ERC721MockUpgradeSafe.sol";

contract ERC721MockUpgradeSafeWithInit is ERC721MockUpgradeSafe {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721Mock_init(name, symbol);
    }
}
import "./mocks/ERC721PausableMockUpgradeSafe.sol";

contract ERC721PausableMockUpgradeSafeWithInit is ERC721PausableMockUpgradeSafe {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721PausableMock_init(name, symbol);
    }
}
import "./mocks/ERC721ReceiverMockUpgradeSafe.sol";

contract ERC721ReceiverMockUpgradeSafeWithInit is ERC721ReceiverMockUpgradeSafe {
    constructor(bytes4 retval, bool reverts) public payable {
        __ERC721ReceiverMock_init(retval, reverts);
    }
}
import "./mocks/ERC777MockUpgradeSafe.sol";

contract ERC777MockUpgradeSafeWithInit is ERC777MockUpgradeSafe {
    constructor(
        address initialHolder,
        uint256 initialBalance,
        string memory name,
        string memory symbol,
        address[] memory defaultOperators
    ) public payable {
        __ERC777Mock_init(initialHolder, initialBalance, name, symbol, defaultOperators);
    }
}
import "./token/ERC777/ERC777UpgradeSafe.sol";

contract ERC777UpgradeSafeWithInit is ERC777UpgradeSafe {
    constructor(
        string memory name,
        string memory symbol,
        address[] memory defaultOperators
    ) public payable {
        __ERC777_init(name, symbol, defaultOperators);
    }
}
import "./mocks/ERC777SenderRecipientMockUpgradeSafe.sol";

contract ERC777SenderRecipientMockUpgradeSafeWithInit is ERC777SenderRecipientMockUpgradeSafe {
    constructor() public payable {
        __ERC777SenderRecipientMock_init();
    }
}
import "./mocks/EtherReceiverMockUpgradeSafe.sol";

contract EtherReceiverMockUpgradeSafeWithInit is EtherReceiverMockUpgradeSafe {
    constructor() public payable {
        __EtherReceiverMock_init();
    }
}
import "./mocks/GSNRecipientERC20FeeMockUpgradeSafe.sol";

contract GSNRecipientERC20FeeMockUpgradeSafeWithInit is GSNRecipientERC20FeeMockUpgradeSafe {
    constructor(string memory name, string memory symbol) public payable {
        __GSNRecipientERC20FeeMock_init(name, symbol);
    }
}
import "./mocks/GSNRecipientMockUpgradeSafe.sol";

contract GSNRecipientMockUpgradeSafeWithInit is GSNRecipientMockUpgradeSafe {
    constructor() public payable {
        __GSNRecipientMock_init();
    }
}
import "./mocks/GSNRecipientSignatureMockUpgradeSafe.sol";

contract GSNRecipientSignatureMockUpgradeSafeWithInit is GSNRecipientSignatureMockUpgradeSafe {
    constructor(address trustedSigner) public payable {
        __GSNRecipientSignatureMock_init(trustedSigner);
    }
}
import "./mocks/InitializableMockUpgradeSafe.sol";

contract InitializableMockUpgradeSafeWithInit is InitializableMockUpgradeSafe {
    constructor() public payable {
        __InitializableMock_init();
    }
}
import "./mocks/MathMockUpgradeSafe.sol";

contract MathMockUpgradeSafeWithInit is MathMockUpgradeSafe {
    constructor() public payable {
        __MathMock_init();
    }
}
import "./mocks/MerkleProofWrapperUpgradeSafe.sol";

contract MerkleProofWrapperUpgradeSafeWithInit is MerkleProofWrapperUpgradeSafe {
    constructor() public payable {
        __MerkleProofWrapper_init();
    }
}
import "./mocks/MultipleInheritanceInitializableMocksUpgradeSafe.sol";

contract SampleHumanUpgradeSafeWithInit is SampleHumanUpgradeSafe {
    constructor() public payable {
        __SampleHuman_init();
    }
}
import "./mocks/MultipleInheritanceInitializableMocksUpgradeSafe.sol";

contract SampleMotherUpgradeSafeWithInit is SampleMotherUpgradeSafe {
    constructor() public payable {
        __SampleMother_init();
    }
}
import "./mocks/MultipleInheritanceInitializableMocksUpgradeSafe.sol";

contract SampleGrampsUpgradeSafeWithInit is SampleGrampsUpgradeSafe {
    constructor() public payable {
        __SampleGramps_init();
    }
}
import "./mocks/MultipleInheritanceInitializableMocksUpgradeSafe.sol";

contract SampleFatherUpgradeSafeWithInit is SampleFatherUpgradeSafe {
    constructor() public payable {
        __SampleFather_init();
    }
}
import "./mocks/MultipleInheritanceInitializableMocksUpgradeSafe.sol";

contract SampleChildUpgradeSafeWithInit is SampleChildUpgradeSafe {
    constructor() public payable {
        __SampleChild_init();
    }
}
import "./mocks/OwnableMockUpgradeSafe.sol";

contract OwnableMockUpgradeSafeWithInit is OwnableMockUpgradeSafe {
    constructor() public payable {
        __OwnableMock_init();
    }
}
import "./mocks/PausableMockUpgradeSafe.sol";

contract PausableMockUpgradeSafeWithInit is PausableMockUpgradeSafe {
    constructor() public payable {
        __PausableMock_init();
    }
}
import "./mocks/PullPaymentMockUpgradeSafe.sol";

contract PullPaymentMockUpgradeSafeWithInit is PullPaymentMockUpgradeSafe {
    constructor() public payable {
        __PullPaymentMock_init();
    }
}
import "./payment/PullPaymentUpgradeSafe.sol";

contract PullPaymentUpgradeSafeWithInit is PullPaymentUpgradeSafe {
    constructor() public payable {
        __PullPayment_init();
    }
}
import "./mocks/ReentrancyAttackUpgradeSafe.sol";

contract ReentrancyAttackUpgradeSafeWithInit is ReentrancyAttackUpgradeSafe {
    constructor() public payable {
        __ReentrancyAttack_init();
    }
}
import "./mocks/ReentrancyMockUpgradeSafe.sol";

contract ReentrancyMockUpgradeSafeWithInit is ReentrancyMockUpgradeSafe {
    constructor() public payable {
        __ReentrancyMock_init();
    }
}
import "./utils/ReentrancyGuardUpgradeSafe.sol";

contract ReentrancyGuardUpgradeSafeWithInit is ReentrancyGuardUpgradeSafe {
    constructor() public payable {
        __ReentrancyGuard_init();
    }
}
import "./mocks/RegressionImplementationUpgradeSafe.sol";

contract Implementation1UpgradeSafeWithInit is Implementation1UpgradeSafe {
    constructor() public payable {
        __Implementation1_init();
    }
}
import "./mocks/RegressionImplementationUpgradeSafe.sol";

contract Implementation2UpgradeSafeWithInit is Implementation2UpgradeSafe {
    constructor() public payable {
        __Implementation2_init();
    }
}
import "./mocks/RegressionImplementationUpgradeSafe.sol";

contract Implementation3UpgradeSafeWithInit is Implementation3UpgradeSafe {
    constructor() public payable {
        __Implementation3_init();
    }
}
import "./mocks/RegressionImplementationUpgradeSafe.sol";

contract Implementation4UpgradeSafeWithInit is Implementation4UpgradeSafe {
    constructor() public payable {
        __Implementation4_init();
    }
}
import "./mocks/SafeCastMockUpgradeSafe.sol";

contract SafeCastMockUpgradeSafeWithInit is SafeCastMockUpgradeSafe {
    constructor() public payable {
        __SafeCastMock_init();
    }
}
import "./mocks/SafeERC20HelperUpgradeSafe.sol";

contract ERC20ReturnFalseMockUpgradeSafeWithInit is ERC20ReturnFalseMockUpgradeSafe {
    constructor() public payable {
        __ERC20ReturnFalseMock_init();
    }
}
import "./mocks/SafeERC20HelperUpgradeSafe.sol";

contract ERC20ReturnTrueMockUpgradeSafeWithInit is ERC20ReturnTrueMockUpgradeSafe {
    constructor() public payable {
        __ERC20ReturnTrueMock_init();
    }
}
import "./mocks/SafeERC20HelperUpgradeSafe.sol";

contract ERC20NoReturnMockUpgradeSafeWithInit is ERC20NoReturnMockUpgradeSafe {
    constructor() public payable {
        __ERC20NoReturnMock_init();
    }
}
import "./mocks/SafeERC20HelperUpgradeSafe.sol";

contract SafeERC20WrapperUpgradeSafeWithInit is SafeERC20WrapperUpgradeSafe {
    constructor(IERC20UpgradeSafe token) public payable {
        __SafeERC20Wrapper_init(token);
    }
}
import "./mocks/SafeMathMockUpgradeSafe.sol";

contract SafeMathMockUpgradeSafeWithInit is SafeMathMockUpgradeSafe {
    constructor() public payable {
        __SafeMathMock_init();
    }
}
import "./mocks/SignedSafeMathMockUpgradeSafe.sol";

contract SignedSafeMathMockUpgradeSafeWithInit is SignedSafeMathMockUpgradeSafe {
    constructor() public payable {
        __SignedSafeMathMock_init();
    }
}
import "./mocks/SingleInheritanceInitializableMocksUpgradeSafe.sol";

contract MigratableMockV1UpgradeSafeWithInit is MigratableMockV1UpgradeSafe {
    constructor() public payable {
        __MigratableMockV1_init();
    }
}
import "./mocks/SingleInheritanceInitializableMocksUpgradeSafe.sol";

contract MigratableMockV2UpgradeSafeWithInit is MigratableMockV2UpgradeSafe {
    constructor() public payable {
        __MigratableMockV2_init();
    }
}
import "./mocks/SingleInheritanceInitializableMocksUpgradeSafe.sol";

contract MigratableMockV3UpgradeSafeWithInit is MigratableMockV3UpgradeSafe {
    constructor() public payable {
        __MigratableMockV3_init();
    }
}
import "./mocks/StringsMockUpgradeSafe.sol";

contract StringsMockUpgradeSafeWithInit is StringsMockUpgradeSafe {
    constructor() public payable {
        __StringsMock_init();
    }
}
import "./payment/escrow/RefundEscrowUpgradeSafe.sol";

contract RefundEscrowUpgradeSafeWithInit is RefundEscrowUpgradeSafe {
    constructor(address payable beneficiary) public payable {
        __RefundEscrow_init(beneficiary);
    }
}
import "./payment/PaymentSplitterUpgradeSafe.sol";

contract PaymentSplitterUpgradeSafeWithInit is PaymentSplitterUpgradeSafe {
    constructor(address[] memory payees, uint256[] memory shares) public payable {
        __PaymentSplitter_init(payees, shares);
    }
}
import "./presets/ERC1155PresetMinterPauserUpgradeSafe.sol";

contract ERC1155PresetMinterPauserUpgradeSafeWithInit is ERC1155PresetMinterPauserUpgradeSafe {
    constructor(string memory uri) public payable {
        __ERC1155PresetMinterPauser_init(uri);
    }
}
import "./presets/ERC20PresetMinterPauserUpgradeSafe.sol";

contract ERC20PresetMinterPauserUpgradeSafeWithInit is ERC20PresetMinterPauserUpgradeSafe {
    constructor(string memory name, string memory symbol) public payable {
        __ERC20PresetMinterPauser_init(name, symbol);
    }
}
import "./presets/ERC721PresetMinterPauserAutoIdUpgradeSafe.sol";

contract ERC721PresetMinterPauserAutoIdUpgradeSafeWithInit is ERC721PresetMinterPauserAutoIdUpgradeSafe {
    constructor(string memory name, string memory symbol, string memory baseURI) public payable {
        __ERC721PresetMinterPauserAutoId_init(name, symbol, baseURI);
    }
}
import "./proxy/ProxyAdminUpgradeSafe.sol";

contract ProxyAdminUpgradeSafeWithInit is ProxyAdminUpgradeSafe {
    constructor() public payable {
        __ProxyAdmin_init();
    }
}
import "./proxy/TransparentUpgradeableProxyUpgradeSafe.sol";

contract TransparentUpgradeableProxyUpgradeSafeWithInit is TransparentUpgradeableProxyUpgradeSafe {
    constructor(address _logic, address _admin, bytes memory _data) public payable {
        __TransparentUpgradeableProxy_init(_logic, _admin, _data);
    }
}
import "./proxy/UpgradeableProxyUpgradeSafe.sol";

contract UpgradeableProxyUpgradeSafeWithInit is UpgradeableProxyUpgradeSafe {
    constructor(address _logic, bytes memory _data) public payable {
        __UpgradeableProxy_init(_logic, _data);
    }
}
import "./token/ERC1155/ERC1155HolderUpgradeSafe.sol";

contract ERC1155HolderUpgradeSafeWithInit is ERC1155HolderUpgradeSafe {
    constructor() public payable {
        __ERC1155Holder_init();
    }
}
import "./token/ERC20/TokenTimelockUpgradeSafe.sol";

contract TokenTimelockUpgradeSafeWithInit is TokenTimelockUpgradeSafe {
    constructor(IERC20UpgradeSafe token, address beneficiary, uint256 releaseTime) public payable {
        __TokenTimelock_init(token, beneficiary, releaseTime);
    }
}
import "./token/ERC721/ERC721HolderUpgradeSafe.sol";

contract ERC721HolderUpgradeSafeWithInit is ERC721HolderUpgradeSafe {
    constructor() public payable {
        __ERC721Holder_init();
    }
}
