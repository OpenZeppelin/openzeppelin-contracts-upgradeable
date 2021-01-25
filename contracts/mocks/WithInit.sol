pragma solidity >=0.6 <0.8;
pragma experimental ABIEncoderV2;

import "../access/TimelockControllerUpgradeable.sol";

contract TimelockControllerUpgradeableWithInit is TimelockControllerUpgradeable {
    constructor(uint256 minDelay, address[] memory proposers, address[] memory executors) public payable {
        __TimelockController_init(minDelay, proposers, executors);
    }
}
import "../token/ERC20/ERC20Upgradeable.sol";

contract ERC20UpgradeableWithInit is ERC20Upgradeable {
    constructor(string memory name_, string memory symbol_) public payable {
        __ERC20_init(name_, symbol_);
    }
}
import "../GSN/GSNRecipientERC20FeeUpgradeable.sol";

contract GSNRecipientERC20FeeUpgradeableWithInit is GSNRecipientERC20FeeUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __GSNRecipientERC20Fee_init(name, symbol);
    }
}
import "../GSN/GSNRecipientERC20FeeUpgradeable.sol";

contract __unstable__ERC20OwnedUpgradeableWithInit is __unstable__ERC20OwnedUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        ____unstable__ERC20Owned_init(name, symbol);
    }
}
import "../GSN/GSNRecipientSignatureUpgradeable.sol";

contract GSNRecipientSignatureUpgradeableWithInit is GSNRecipientSignatureUpgradeable {
    constructor(address trustedSigner) public payable {
        __GSNRecipientSignature_init(trustedSigner);
    }
}
import "../introspection/ERC1820ImplementerUpgradeable.sol";

contract ERC1820ImplementerUpgradeableWithInit is ERC1820ImplementerUpgradeable {
    constructor() public payable {
        __ERC1820Implementer_init();
    }
}
import "./AccessControlMockUpgradeable.sol";

contract AccessControlMockUpgradeableWithInit is AccessControlMockUpgradeable {
    constructor() public payable {
        __AccessControlMock_init();
    }
}
import "./AddressImplUpgradeable.sol";

contract AddressImplUpgradeableWithInit is AddressImplUpgradeable {
    constructor() public payable {
        __AddressImpl_init();
    }
}
import "./ArraysImplUpgradeable.sol";

contract ArraysImplUpgradeableWithInit is ArraysImplUpgradeable {
    constructor(uint256[] memory array) public payable {
        __ArraysImpl_init(array);
    }
}
import "./BadBeaconUpgradeable.sol";

contract BadBeaconNoImplUpgradeableWithInit is BadBeaconNoImplUpgradeable {
    constructor() public payable {
        __BadBeaconNoImpl_init();
    }
}
import "./BadBeaconUpgradeable.sol";

contract BadBeaconNotContractUpgradeableWithInit is BadBeaconNotContractUpgradeable {
    constructor() public payable {
        __BadBeaconNotContract_init();
    }
}
import "./CallReceiverMockUpgradeable.sol";

contract CallReceiverMockUpgradeableWithInit is CallReceiverMockUpgradeable {
    constructor() public payable {
        __CallReceiverMock_init();
    }
}
import "./ClashingImplementationUpgradeable.sol";

contract ClashingImplementationUpgradeableWithInit is ClashingImplementationUpgradeable {
    constructor() public payable {
        __ClashingImplementation_init();
    }
}
import "./ClonesMockUpgradeable.sol";

contract ClonesMockUpgradeableWithInit is ClonesMockUpgradeable {
    constructor() public payable {
        __ClonesMock_init();
    }
}
import "./ConditionalEscrowMockUpgradeable.sol";

contract ConditionalEscrowMockUpgradeableWithInit is ConditionalEscrowMockUpgradeable {
    constructor() public payable {
        __ConditionalEscrowMock_init();
    }
}
import "../payment/escrow/EscrowUpgradeable.sol";

contract EscrowUpgradeableWithInit is EscrowUpgradeable {
    constructor() public payable {
        __Escrow_init();
    }
}
import "./ContextMockUpgradeable.sol";

contract ContextMockUpgradeableWithInit is ContextMockUpgradeable {
    constructor() public payable {
        __ContextMock_init();
    }
}
import "./ContextMockUpgradeable.sol";

contract ContextMockCallerUpgradeableWithInit is ContextMockCallerUpgradeable {
    constructor() public payable {
        __ContextMockCaller_init();
    }
}
import "./CountersImplUpgradeable.sol";

contract CountersImplUpgradeableWithInit is CountersImplUpgradeable {
    constructor() public payable {
        __CountersImpl_init();
    }
}
import "./Create2ImplUpgradeable.sol";

contract Create2ImplUpgradeableWithInit is Create2ImplUpgradeable {
    constructor() public payable {
        __Create2Impl_init();
    }
}
import "./DummyImplementationUpgradeable.sol";

contract DummyImplementationUpgradeableWithInit is DummyImplementationUpgradeable {
    constructor() public payable {
        __DummyImplementation_init();
    }
}
import "./DummyImplementationUpgradeable.sol";

contract DummyImplementationV2UpgradeableWithInit is DummyImplementationV2Upgradeable {
    constructor() public payable {
        __DummyImplementationV2_init();
    }
}
import "./ECDSAMockUpgradeable.sol";

contract ECDSAMockUpgradeableWithInit is ECDSAMockUpgradeable {
    constructor() public payable {
        __ECDSAMock_init();
    }
}
import "./EIP712ExternalUpgradeable.sol";

contract EIP712ExternalUpgradeableWithInit is EIP712ExternalUpgradeable {
    constructor(string memory name, string memory version) public payable {
        __EIP712External_init(name, version);
    }
}
import "./EnumerableMapMockUpgradeable.sol";

contract EnumerableMapMockUpgradeableWithInit is EnumerableMapMockUpgradeable {
    constructor() public payable {
        __EnumerableMapMock_init();
    }
}
import "./EnumerableSetMockUpgradeable.sol";

contract EnumerableBytes32SetMockUpgradeableWithInit is EnumerableBytes32SetMockUpgradeable {
    constructor() public payable {
        __EnumerableBytes32SetMock_init();
    }
}
import "./EnumerableSetMockUpgradeable.sol";

contract EnumerableAddressSetMockUpgradeableWithInit is EnumerableAddressSetMockUpgradeable {
    constructor() public payable {
        __EnumerableAddressSetMock_init();
    }
}
import "./EnumerableSetMockUpgradeable.sol";

contract EnumerableUintSetMockUpgradeableWithInit is EnumerableUintSetMockUpgradeable {
    constructor() public payable {
        __EnumerableUintSetMock_init();
    }
}
import "./ERC1155BurnableMockUpgradeable.sol";

contract ERC1155BurnableMockUpgradeableWithInit is ERC1155BurnableMockUpgradeable {
    constructor(string memory uri) public payable {
        __ERC1155BurnableMock_init(uri);
    }
}
import "../token/ERC1155/ERC1155Upgradeable.sol";

contract ERC1155UpgradeableWithInit is ERC1155Upgradeable {
    constructor(string memory uri_) public payable {
        __ERC1155_init(uri_);
    }
}
import "./ERC1155MockUpgradeable.sol";

contract ERC1155MockUpgradeableWithInit is ERC1155MockUpgradeable {
    constructor(string memory uri) public payable {
        __ERC1155Mock_init(uri);
    }
}
import "./ERC1155PausableMockUpgradeable.sol";

contract ERC1155PausableMockUpgradeableWithInit is ERC1155PausableMockUpgradeable {
    constructor(string memory uri) public payable {
        __ERC1155PausableMock_init(uri);
    }
}
import "./ERC1155ReceiverMockUpgradeable.sol";

contract ERC1155ReceiverMockUpgradeableWithInit is ERC1155ReceiverMockUpgradeable {
    constructor(
        bytes4 recRetval,
        bool recReverts,
        bytes4 batRetval,
        bool batReverts
    ) public payable {
        __ERC1155ReceiverMock_init(recRetval, recReverts, batRetval, batReverts);
    }
}
import "./ERC165MockUpgradeable.sol";

contract ERC165MockUpgradeableWithInit is ERC165MockUpgradeable {
    constructor() public payable {
        __ERC165Mock_init();
    }
}
import "./ERC165/ERC165InterfacesSupportedUpgradeable.sol";

contract SupportsInterfaceWithLookupMockUpgradeableWithInit is SupportsInterfaceWithLookupMockUpgradeable {
    constructor() public payable {
        __SupportsInterfaceWithLookupMock_init();
    }
}
import "./ERC165/ERC165InterfacesSupportedUpgradeable.sol";

contract ERC165InterfacesSupportedUpgradeableWithInit is ERC165InterfacesSupportedUpgradeable {
    constructor(bytes4[] memory interfaceIds) public payable {
        __ERC165InterfacesSupported_init(interfaceIds);
    }
}
import "./ERC165/ERC165NotSupportedUpgradeable.sol";

contract ERC165NotSupportedUpgradeableWithInit is ERC165NotSupportedUpgradeable {
    constructor() public payable {
        __ERC165NotSupported_init();
    }
}
import "./ERC165CheckerMockUpgradeable.sol";

contract ERC165CheckerMockUpgradeableWithInit is ERC165CheckerMockUpgradeable {
    constructor() public payable {
        __ERC165CheckerMock_init();
    }
}
import "./ERC1820ImplementerMockUpgradeable.sol";

contract ERC1820ImplementerMockUpgradeableWithInit is ERC1820ImplementerMockUpgradeable {
    constructor() public payable {
        __ERC1820ImplementerMock_init();
    }
}
import "./ERC20BurnableMockUpgradeable.sol";

contract ERC20BurnableMockUpgradeableWithInit is ERC20BurnableMockUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public payable {
        __ERC20BurnableMock_init(name, symbol, initialAccount, initialBalance);
    }
}
import "./ERC20CappedMockUpgradeable.sol";

contract ERC20CappedMockUpgradeableWithInit is ERC20CappedMockUpgradeable {
    constructor(string memory name, string memory symbol, uint256 cap) public payable {
        __ERC20CappedMock_init(name, symbol, cap);
    }
}
import "./ERC20DecimalsMockUpgradeable.sol";

contract ERC20DecimalsMockUpgradeableWithInit is ERC20DecimalsMockUpgradeable {
    constructor(string memory name, string memory symbol, uint8 decimals) public payable {
        __ERC20DecimalsMock_init(name, symbol, decimals);
    }
}
import "./ERC20MockUpgradeable.sol";

contract ERC20MockUpgradeableWithInit is ERC20MockUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public payable {
        __ERC20Mock_init(name, symbol, initialAccount, initialBalance);
    }
}
import "./ERC20PausableMockUpgradeable.sol";

contract ERC20PausableMockUpgradeableWithInit is ERC20PausableMockUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public payable {
        __ERC20PausableMock_init(name, symbol, initialAccount, initialBalance);
    }
}
import "./ERC20PermitMockUpgradeable.sol";

contract ERC20PermitMockUpgradeableWithInit is ERC20PermitMockUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public payable {
        __ERC20PermitMock_init(name, symbol, initialAccount, initialBalance);
    }
}
import "./ERC20SnapshotMockUpgradeable.sol";

contract ERC20SnapshotMockUpgradeableWithInit is ERC20SnapshotMockUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public payable {
        __ERC20SnapshotMock_init(name, symbol, initialAccount, initialBalance);
    }
}
import "./ERC721BurnableMockUpgradeable.sol";

contract ERC721BurnableMockUpgradeableWithInit is ERC721BurnableMockUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721BurnableMock_init(name, symbol);
    }
}
import "../token/ERC721/ERC721Upgradeable.sol";

contract ERC721UpgradeableWithInit is ERC721Upgradeable {
    constructor(string memory name_, string memory symbol_) public payable {
        __ERC721_init(name_, symbol_);
    }
}
import "./ERC721GSNRecipientMockUpgradeable.sol";

contract ERC721GSNRecipientMockUpgradeableWithInit is ERC721GSNRecipientMockUpgradeable {
    constructor(string memory name, string memory symbol, address trustedSigner) public payable {
        __ERC721GSNRecipientMock_init(name, symbol, trustedSigner);
    }
}
import "./ERC721MockUpgradeable.sol";

contract ERC721MockUpgradeableWithInit is ERC721MockUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721Mock_init(name, symbol);
    }
}
import "./ERC721PausableMockUpgradeable.sol";

contract ERC721PausableMockUpgradeableWithInit is ERC721PausableMockUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721PausableMock_init(name, symbol);
    }
}
import "./ERC721ReceiverMockUpgradeable.sol";

contract ERC721ReceiverMockUpgradeableWithInit is ERC721ReceiverMockUpgradeable {
    constructor(bytes4 retval, bool reverts) public payable {
        __ERC721ReceiverMock_init(retval, reverts);
    }
}
import "./ERC777MockUpgradeable.sol";

contract ERC777MockUpgradeableWithInit is ERC777MockUpgradeable {
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
import "../token/ERC777/ERC777Upgradeable.sol";

contract ERC777UpgradeableWithInit is ERC777Upgradeable {
    constructor(
        string memory name_,
        string memory symbol_,
        address[] memory defaultOperators_
    ) public payable {
        __ERC777_init(name_, symbol_, defaultOperators_);
    }
}
import "./ERC777SenderRecipientMockUpgradeable.sol";

contract ERC777SenderRecipientMockUpgradeableWithInit is ERC777SenderRecipientMockUpgradeable {
    constructor() public payable {
        __ERC777SenderRecipientMock_init();
    }
}
import "./EtherReceiverMockUpgradeable.sol";

contract EtherReceiverMockUpgradeableWithInit is EtherReceiverMockUpgradeable {
    constructor() public payable {
        __EtherReceiverMock_init();
    }
}
import "./GSNRecipientERC20FeeMockUpgradeable.sol";

contract GSNRecipientERC20FeeMockUpgradeableWithInit is GSNRecipientERC20FeeMockUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __GSNRecipientERC20FeeMock_init(name, symbol);
    }
}
import "./GSNRecipientMockUpgradeable.sol";

contract GSNRecipientMockUpgradeableWithInit is GSNRecipientMockUpgradeable {
    constructor() public payable {
        __GSNRecipientMock_init();
    }
}
import "./GSNRecipientSignatureMockUpgradeable.sol";

contract GSNRecipientSignatureMockUpgradeableWithInit is GSNRecipientSignatureMockUpgradeable {
    constructor(address trustedSigner) public payable {
        __GSNRecipientSignatureMock_init(trustedSigner);
    }
}
import "./MathMockUpgradeable.sol";

contract MathMockUpgradeableWithInit is MathMockUpgradeable {
    constructor() public payable {
        __MathMock_init();
    }
}
import "./MerkleProofWrapperUpgradeable.sol";

contract MerkleProofWrapperUpgradeableWithInit is MerkleProofWrapperUpgradeable {
    constructor() public payable {
        __MerkleProofWrapper_init();
    }
}
import "./OwnableMockUpgradeable.sol";

contract OwnableMockUpgradeableWithInit is OwnableMockUpgradeable {
    constructor() public payable {
        __OwnableMock_init();
    }
}
import "./PausableMockUpgradeable.sol";

contract PausableMockUpgradeableWithInit is PausableMockUpgradeable {
    constructor() public payable {
        __PausableMock_init();
    }
}
import "./PullPaymentMockUpgradeable.sol";

contract PullPaymentMockUpgradeableWithInit is PullPaymentMockUpgradeable {
    constructor() public payable {
        __PullPaymentMock_init();
    }
}
import "./ReentrancyAttackUpgradeable.sol";

contract ReentrancyAttackUpgradeableWithInit is ReentrancyAttackUpgradeable {
    constructor() public payable {
        __ReentrancyAttack_init();
    }
}
import "./ReentrancyMockUpgradeable.sol";

contract ReentrancyMockUpgradeableWithInit is ReentrancyMockUpgradeable {
    constructor() public payable {
        __ReentrancyMock_init();
    }
}
import "./SafeCastMockUpgradeable.sol";

contract SafeCastMockUpgradeableWithInit is SafeCastMockUpgradeable {
    constructor() public payable {
        __SafeCastMock_init();
    }
}
import "./SafeERC20HelperUpgradeable.sol";

contract ERC20ReturnFalseMockUpgradeableWithInit is ERC20ReturnFalseMockUpgradeable {
    constructor() public payable {
        __ERC20ReturnFalseMock_init();
    }
}
import "./SafeERC20HelperUpgradeable.sol";

contract ERC20ReturnTrueMockUpgradeableWithInit is ERC20ReturnTrueMockUpgradeable {
    constructor() public payable {
        __ERC20ReturnTrueMock_init();
    }
}
import "./SafeERC20HelperUpgradeable.sol";

contract ERC20NoReturnMockUpgradeableWithInit is ERC20NoReturnMockUpgradeable {
    constructor() public payable {
        __ERC20NoReturnMock_init();
    }
}
import "./SafeERC20HelperUpgradeable.sol";

contract SafeERC20WrapperUpgradeableWithInit is SafeERC20WrapperUpgradeable {
    constructor(IERC20Upgradeable token) public payable {
        __SafeERC20Wrapper_init(token);
    }
}
import "./SafeMathMockUpgradeable.sol";

contract SafeMathMockUpgradeableWithInit is SafeMathMockUpgradeable {
    constructor() public payable {
        __SafeMathMock_init();
    }
}
import "./SignedSafeMathMockUpgradeable.sol";

contract SignedSafeMathMockUpgradeableWithInit is SignedSafeMathMockUpgradeable {
    constructor() public payable {
        __SignedSafeMathMock_init();
    }
}
import "./StringsMockUpgradeable.sol";

contract StringsMockUpgradeableWithInit is StringsMockUpgradeable {
    constructor() public payable {
        __StringsMock_init();
    }
}
import "../payment/escrow/RefundEscrowUpgradeable.sol";

contract RefundEscrowUpgradeableWithInit is RefundEscrowUpgradeable {
    constructor(address payable beneficiary_) public payable {
        __RefundEscrow_init(beneficiary_);
    }
}
import "../payment/PaymentSplitterUpgradeable.sol";

contract PaymentSplitterUpgradeableWithInit is PaymentSplitterUpgradeable {
    constructor(address[] memory payees, uint256[] memory shares_) public payable {
        __PaymentSplitter_init(payees, shares_);
    }
}
import "../presets/ERC1155PresetMinterPauserUpgradeable.sol";

contract ERC1155PresetMinterPauserUpgradeableWithInit is ERC1155PresetMinterPauserUpgradeable {
    constructor(string memory uri) public payable {
        __ERC1155PresetMinterPauser_init(uri);
    }
}
import "../presets/ERC20PresetFixedSupplyUpgradeable.sol";

contract ERC20PresetFixedSupplyUpgradeableWithInit is ERC20PresetFixedSupplyUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        uint256 initialSupply,
        address owner
    ) public payable {
        __ERC20PresetFixedSupply_init(name, symbol, initialSupply, owner);
    }
}
import "../presets/ERC20PresetMinterPauserUpgradeable.sol";

contract ERC20PresetMinterPauserUpgradeableWithInit is ERC20PresetMinterPauserUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC20PresetMinterPauser_init(name, symbol);
    }
}
import "../presets/ERC721PresetMinterPauserAutoIdUpgradeable.sol";

contract ERC721PresetMinterPauserAutoIdUpgradeableWithInit is ERC721PresetMinterPauserAutoIdUpgradeable {
    constructor(string memory name, string memory symbol, string memory baseURI) public payable {
        __ERC721PresetMinterPauserAutoId_init(name, symbol, baseURI);
    }
}
import "../presets/ERC777PresetFixedSupplyUpgradeable.sol";

contract ERC777PresetFixedSupplyUpgradeableWithInit is ERC777PresetFixedSupplyUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        address[] memory defaultOperators,
        uint256 initialSupply,
        address owner
    ) public payable {
        __ERC777PresetFixedSupply_init(name, symbol, defaultOperators, initialSupply, owner);
    }
}
import "../token/ERC1155/ERC1155HolderUpgradeable.sol";

contract ERC1155HolderUpgradeableWithInit is ERC1155HolderUpgradeable {
    constructor() public payable {
        __ERC1155Holder_init();
    }
}
import "../token/ERC20/TokenTimelockUpgradeable.sol";

contract TokenTimelockUpgradeableWithInit is TokenTimelockUpgradeable {
    constructor(IERC20Upgradeable token_, address beneficiary_, uint256 releaseTime_) public payable {
        __TokenTimelock_init(token_, beneficiary_, releaseTime_);
    }
}
import "../token/ERC721/ERC721HolderUpgradeable.sol";

contract ERC721HolderUpgradeableWithInit is ERC721HolderUpgradeable {
    constructor() public payable {
        __ERC721Holder_init();
    }
}
