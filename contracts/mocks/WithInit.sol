pragma solidity >=0.6 <0.9;
pragma experimental ABIEncoderV2;

import "./AccessControlMockUpgradeable.sol";

contract AccessControlMockUpgradeableWithInit is AccessControlMockUpgradeable {
    constructor() public payable {
        __AccessControlMock_init();
    }
}
import "../governance/TimelockControllerUpgradeable.sol";

contract TimelockControllerUpgradeableWithInit is TimelockControllerUpgradeable {
    constructor(
        uint256 minDelay,
        address[] memory proposers,
        address[] memory executors
    ) public payable {
        __TimelockController_init(minDelay, proposers, executors);
    }
}
import "../token/ERC721/presets/ERC721PresetMinterPauserAutoIdUpgradeable.sol";

contract ERC721PresetMinterPauserAutoIdUpgradeableWithInit is ERC721PresetMinterPauserAutoIdUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        string memory baseTokenURI
    ) public payable {
        __ERC721PresetMinterPauserAutoId_init(name, symbol, baseTokenURI);
    }
}
import "../token/ERC721/ERC721Upgradeable.sol";

contract ERC721UpgradeableWithInit is ERC721Upgradeable {
    constructor(string memory name_, string memory symbol_) public payable {
        __ERC721_init(name_, symbol_);
    }
}
import "../token/ERC20/ERC20Upgradeable.sol";

contract ERC20UpgradeableWithInit is ERC20Upgradeable {
    constructor(string memory name_, string memory symbol_) public payable {
        __ERC20_init(name_, symbol_);
    }
}
import "./MathMockUpgradeable.sol";

contract MathMockUpgradeableWithInit is MathMockUpgradeable {
    constructor() public payable {
        __MathMock_init();
    }
}
import "./ERC20VotesMockUpgradeable.sol";

contract ERC20VotesMockUpgradeableWithInit is ERC20VotesMockUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC20VotesMock_init(name, symbol);
    }
}
import "./ERC1271WalletMockUpgradeable.sol";

contract ERC1271WalletMockUpgradeableWithInit is ERC1271WalletMockUpgradeable {
    constructor(address originalOwner) public payable {
        __ERC1271WalletMock_init(originalOwner);
    }
}
import "./MulticallTokenMockUpgradeable.sol";

contract MulticallTokenMockUpgradeableWithInit is MulticallTokenMockUpgradeable {
    constructor(uint256 initialBalance) public payable {
        __MulticallTokenMock_init(initialBalance);
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
import "../token/ERC20/presets/ERC20PresetMinterPauserUpgradeable.sol";

contract ERC20PresetMinterPauserUpgradeableWithInit is ERC20PresetMinterPauserUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC20PresetMinterPauser_init(name, symbol);
    }
}
import "../token/ERC1155/presets/ERC1155PresetMinterPauserUpgradeable.sol";

contract ERC1155PresetMinterPauserUpgradeableWithInit is ERC1155PresetMinterPauserUpgradeable {
    constructor(string memory uri) public payable {
        __ERC1155PresetMinterPauser_init(uri);
    }
}
import "../token/ERC1155/ERC1155Upgradeable.sol";

contract ERC1155UpgradeableWithInit is ERC1155Upgradeable {
    constructor(string memory uri_) public payable {
        __ERC1155_init(uri_);
    }
}
import "./PausableMockUpgradeable.sol";

contract PausableMockUpgradeableWithInit is PausableMockUpgradeable {
    constructor() public payable {
        __PausableMock_init();
    }
}
import "./ERC721URIStorageMockUpgradeable.sol";

contract ERC721URIStorageMockUpgradeableWithInit is ERC721URIStorageMockUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721URIStorageMock_init(name, symbol);
    }
}
import "./ERC721MockUpgradeable.sol";

contract ERC721MockUpgradeableWithInit is ERC721MockUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721Mock_init(name, symbol);
    }
}
import "./ERC165CheckerMockUpgradeable.sol";

contract ERC165CheckerMockUpgradeableWithInit is ERC165CheckerMockUpgradeable {
    constructor() public payable {
        __ERC165CheckerMock_init();
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
import "./ERC165StorageMockUpgradeable.sol";

contract ERC165StorageMockUpgradeableWithInit is ERC165StorageMockUpgradeable {
    constructor() public payable {
        __ERC165StorageMock_init();
    }
}
import "./ERC165MockUpgradeable.sol";

contract ERC165MockUpgradeableWithInit is ERC165MockUpgradeable {
    constructor() public payable {
        __ERC165Mock_init();
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
import "./ERC1155SupplyMockUpgradeable.sol";

contract ERC1155SupplyMockUpgradeableWithInit is ERC1155SupplyMockUpgradeable {
    constructor(string memory uri) public payable {
        __ERC1155SupplyMock_init(uri);
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
import "./ERC1155BurnableMockUpgradeable.sol";

contract ERC1155BurnableMockUpgradeableWithInit is ERC1155BurnableMockUpgradeable {
    constructor(string memory uri) public payable {
        __ERC1155BurnableMock_init(uri);
    }
}
import "../token/ERC1155/utils/ERC1155HolderUpgradeable.sol";

contract ERC1155HolderUpgradeableWithInit is ERC1155HolderUpgradeable {
    constructor() public payable {
        __ERC1155Holder_init();
    }
}
import "./ERC721EnumerableMockUpgradeable.sol";

contract ERC721EnumerableMockUpgradeableWithInit is ERC721EnumerableMockUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721EnumerableMock_init(name, symbol);
    }
}
import "./StringsMockUpgradeable.sol";

contract StringsMockUpgradeableWithInit is StringsMockUpgradeable {
    constructor() public payable {
        __StringsMock_init();
    }
}
import "../token/ERC721/utils/ERC721HolderUpgradeable.sol";

contract ERC721HolderUpgradeableWithInit is ERC721HolderUpgradeable {
    constructor() public payable {
        __ERC721Holder_init();
    }
}
import "./ERC721ReceiverMockUpgradeable.sol";

contract ERC721ReceiverMockUpgradeableWithInit is ERC721ReceiverMockUpgradeable {
    constructor(bytes4 retval, Error error) public payable {
        __ERC721ReceiverMock_init(retval, error);
    }
}
import "./ERC721BurnableMockUpgradeable.sol";

contract ERC721BurnableMockUpgradeableWithInit is ERC721BurnableMockUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721BurnableMock_init(name, symbol);
    }
}
import "./ERC721PausableMockUpgradeable.sol";

contract ERC721PausableMockUpgradeableWithInit is ERC721PausableMockUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC721PausableMock_init(name, symbol);
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
import "../token/ERC20/utils/TokenTimelockUpgradeable.sol";

contract TokenTimelockUpgradeableWithInit is TokenTimelockUpgradeable {
    constructor(
        IERC20Upgradeable token_,
        address beneficiary_,
        uint256 releaseTime_
    ) public payable {
        __TokenTimelock_init(token_, beneficiary_, releaseTime_);
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
import "../token/ERC777/presets/ERC777PresetFixedSupplyUpgradeable.sol";

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
import "./ERC777SenderRecipientMockUpgradeable.sol";

contract ERC777SenderRecipientMockUpgradeableWithInit is ERC777SenderRecipientMockUpgradeable {
    constructor() public payable {
        __ERC777SenderRecipientMock_init();
    }
}
import "../utils/introspection/ERC1820ImplementerUpgradeable.sol";

contract ERC1820ImplementerUpgradeableWithInit is ERC1820ImplementerUpgradeable {
    constructor() public payable {
        __ERC1820Implementer_init();
    }
}
import "./ERC1820ImplementerMockUpgradeable.sol";

contract ERC1820ImplementerMockUpgradeableWithInit is ERC1820ImplementerMockUpgradeable {
    constructor() public payable {
        __ERC1820ImplementerMock_init();
    }
}
import "./Create2ImplUpgradeable.sol";

contract Create2ImplUpgradeableWithInit is Create2ImplUpgradeable {
    constructor() public payable {
        __Create2Impl_init();
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
import "./ERC3156FlashBorrowerMockUpgradeable.sol";

contract ERC3156FlashBorrowerMockUpgradeableWithInit is ERC3156FlashBorrowerMockUpgradeable {
    constructor(bool enableReturn, bool enableApprove) public payable {
        __ERC3156FlashBorrowerMock_init(enableReturn, enableApprove);
    }
}
import "./ERC20FlashMintMockUpgradeable.sol";

contract ERC20FlashMintMockUpgradeableWithInit is ERC20FlashMintMockUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        address initialAccount,
        uint256 initialBalance
    ) public payable {
        __ERC20FlashMintMock_init(name, symbol, initialAccount, initialBalance);
    }
}
import "./ERC20WrapperMockUpgradeable.sol";

contract ERC20WrapperMockUpgradeableWithInit is ERC20WrapperMockUpgradeable {
    constructor(
        IERC20Upgradeable _underlyingToken,
        string memory name,
        string memory symbol
    ) public payable {
        __ERC20WrapperMock_init(_underlyingToken, name, symbol);
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
import "../token/ERC20/presets/ERC20PresetFixedSupplyUpgradeable.sol";

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
import "./ERC2771ContextMockUpgradeable.sol";

contract ERC2771ContextMockUpgradeableWithInit is ERC2771ContextMockUpgradeable {
    constructor(address trustedForwarder) public payable {
        __ERC2771ContextMock_init(trustedForwarder);
    }
}
import "../finance/PaymentSplitterUpgradeable.sol";

contract PaymentSplitterUpgradeableWithInit is PaymentSplitterUpgradeable {
    constructor(address[] memory payees, uint256[] memory shares_) public payable {
        __PaymentSplitter_init(payees, shares_);
    }
}
import "./SafeMathMockUpgradeable.sol";

contract SafeMathMockUpgradeableWithInit is SafeMathMockUpgradeable {
    constructor() public payable {
        __SafeMathMock_init();
    }
}
import "./EIP712ExternalUpgradeable.sol";

contract EIP712ExternalUpgradeableWithInit is EIP712ExternalUpgradeable {
    constructor(string memory name, string memory version) public payable {
        __EIP712External_init(name, version);
    }
}
import "../metatx/MinimalForwarderUpgradeable.sol";

contract MinimalForwarderUpgradeableWithInit is MinimalForwarderUpgradeable {
    constructor() public payable {
        __MinimalForwarder_init();
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
import "./ERC20DecimalsMockUpgradeable.sol";

contract ERC20DecimalsMockUpgradeableWithInit is ERC20DecimalsMockUpgradeable {
    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_
    ) public payable {
        __ERC20DecimalsMock_init(name_, symbol_, decimals_);
    }
}
import "./ERC20CappedMockUpgradeable.sol";

contract ERC20CappedMockUpgradeableWithInit is ERC20CappedMockUpgradeable {
    constructor(
        string memory name,
        string memory symbol,
        uint256 cap
    ) public payable {
        __ERC20CappedMock_init(name, symbol, cap);
    }
}
import "./MulticallTestUpgradeable.sol";

contract MulticallTestUpgradeableWithInit is MulticallTestUpgradeable {
    constructor() public payable {
        __MulticallTest_init();
    }
}
import "../utils/escrow/EscrowUpgradeable.sol";

contract EscrowUpgradeableWithInit is EscrowUpgradeable {
    constructor() public payable {
        __Escrow_init();
    }
}
import "./PullPaymentMockUpgradeable.sol";

contract PullPaymentMockUpgradeableWithInit is PullPaymentMockUpgradeable {
    constructor() public payable {
        __PullPaymentMock_init();
    }
}
import "../utils/escrow/RefundEscrowUpgradeable.sol";

contract RefundEscrowUpgradeableWithInit is RefundEscrowUpgradeable {
    constructor(address payable beneficiary_) public payable {
        __RefundEscrow_init(beneficiary_);
    }
}
import "./ConditionalEscrowMockUpgradeable.sol";

contract ConditionalEscrowMockUpgradeableWithInit is ConditionalEscrowMockUpgradeable {
    constructor() public payable {
        __ConditionalEscrowMock_init();
    }
}
import "./ClonesMockUpgradeable.sol";

contract ClonesMockUpgradeableWithInit is ClonesMockUpgradeable {
    constructor() public payable {
        __ClonesMock_init();
    }
}
import "./AddressImplUpgradeable.sol";

contract AddressImplUpgradeableWithInit is AddressImplUpgradeable {
    constructor() public payable {
        __AddressImpl_init();
    }
}
import "./StorageSlotMockUpgradeable.sol";

contract StorageSlotMockUpgradeableWithInit is StorageSlotMockUpgradeable {
    constructor() public payable {
        __StorageSlotMock_init();
    }
}
import "./UUPS/TestInProdUpgradeable.sol";

contract UUPSUpgradeableMockUpgradeableWithInit is UUPSUpgradeableMockUpgradeable {
    constructor() public payable {
        __UUPSUpgradeableMock_init();
    }
}
import "./UUPS/TestInProdUpgradeable.sol";

contract UUPSUpgradeableUnsafeMockUpgradeableWithInit is UUPSUpgradeableUnsafeMockUpgradeable {
    constructor() public payable {
        __UUPSUpgradeableUnsafeMock_init();
    }
}
import "./UUPS/TestInProdUpgradeable.sol";

contract UUPSUpgradeableBrokenMockUpgradeableWithInit is UUPSUpgradeableBrokenMockUpgradeable {
    constructor() public payable {
        __UUPSUpgradeableBrokenMock_init();
    }
}
import "./CountersImplUpgradeable.sol";

contract CountersImplUpgradeableWithInit is CountersImplUpgradeable {
    constructor() public payable {
        __CountersImpl_init();
    }
}
import "./OwnableMockUpgradeable.sol";

contract OwnableMockUpgradeableWithInit is OwnableMockUpgradeable {
    constructor() public payable {
        __OwnableMock_init();
    }
}
import "./SignatureCheckerMockUpgradeable.sol";

contract SignatureCheckerMockUpgradeableWithInit is SignatureCheckerMockUpgradeable {
    constructor() public payable {
        __SignatureCheckerMock_init();
    }
}
import "./ECDSAMockUpgradeable.sol";

contract ECDSAMockUpgradeableWithInit is ECDSAMockUpgradeable {
    constructor() public payable {
        __ECDSAMock_init();
    }
}
import "./SafeCastMockUpgradeable.sol";

contract SafeCastMockUpgradeableWithInit is SafeCastMockUpgradeable {
    constructor() public payable {
        __SafeCastMock_init();
    }
}
import "./ERC20VotesCompMockUpgradeable.sol";

contract ERC20VotesCompMockUpgradeableWithInit is ERC20VotesCompMockUpgradeable {
    constructor(string memory name, string memory symbol) public payable {
        __ERC20VotesCompMock_init(name, symbol);
    }
}
import "./ArraysImplUpgradeable.sol";

contract ArraysImplUpgradeableWithInit is ArraysImplUpgradeable {
    constructor(uint256[] memory array) public payable {
        __ArraysImpl_init(array);
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
import "./AccessControlEnumerableMockUpgradeable.sol";

contract AccessControlEnumerableMockUpgradeableWithInit is AccessControlEnumerableMockUpgradeable {
    constructor() public payable {
        __AccessControlEnumerableMock_init();
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
import "./EnumerableMapMockUpgradeable.sol";

contract EnumerableMapMockUpgradeableWithInit is EnumerableMapMockUpgradeable {
    constructor() public payable {
        __EnumerableMapMock_init();
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
import "./BitmapMockUpgradeable.sol";

contract BitMapMockUpgradeableWithInit is BitMapMockUpgradeable {
    constructor() public payable {
        __BitMapMock_init();
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
import "./ERC165/ERC165MissingDataUpgradeable.sol";

contract ERC165MissingDataUpgradeableWithInit is ERC165MissingDataUpgradeable {
    constructor() public payable {
        __ERC165MissingData_init();
    }
}
import "./ERC165/ERC165NotSupportedUpgradeable.sol";

contract ERC165NotSupportedUpgradeableWithInit is ERC165NotSupportedUpgradeable {
    constructor() public payable {
        __ERC165NotSupported_init();
    }
}
import "./EtherReceiverMockUpgradeable.sol";

contract EtherReceiverMockUpgradeableWithInit is EtherReceiverMockUpgradeable {
    constructor() public payable {
        __EtherReceiverMock_init();
    }
}
import "./MerkleProofWrapperUpgradeable.sol";

contract MerkleProofWrapperUpgradeableWithInit is MerkleProofWrapperUpgradeable {
    constructor() public payable {
        __MerkleProofWrapper_init();
    }
}
import "./SignedSafeMathMockUpgradeable.sol";

contract SignedSafeMathMockUpgradeableWithInit is SignedSafeMathMockUpgradeable {
    constructor() public payable {
        __SignedSafeMathMock_init();
    }
}
