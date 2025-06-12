// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7 <0.9;
pragma experimental ABIEncoderV2;

import "../access/AccessControlUpgradeable.sol";

contract AccessControlUpgradeableWithInit is AccessControlUpgradeable {
    constructor() payable initializer {
        __AccessControl_init();
    }
}
import "../access/extensions/AccessControlDefaultAdminRulesUpgradeable.sol";

contract AccessControlDefaultAdminRulesUpgradeableWithInit is AccessControlDefaultAdminRulesUpgradeable {
    constructor(uint48 initialDelay, address initialDefaultAdmin) payable initializer {
        __AccessControlDefaultAdminRules_init(initialDelay, initialDefaultAdmin);
    }
}
import "../access/extensions/AccessControlEnumerableUpgradeable.sol";

contract AccessControlEnumerableUpgradeableWithInit is AccessControlEnumerableUpgradeable {
    constructor() payable initializer {
        __AccessControlEnumerable_init();
    }
}
import "../access/manager/AccessManagedUpgradeable.sol";

contract AccessManagedUpgradeableWithInit is AccessManagedUpgradeable {
    constructor(address initialAuthority) payable initializer {
        __AccessManaged_init(initialAuthority);
    }
}
import "../access/manager/AccessManagerUpgradeable.sol";

contract AccessManagerUpgradeableWithInit is AccessManagerUpgradeable {
    constructor(address initialAdmin) payable initializer {
        __AccessManager_init(initialAdmin);
    }
}
import "../access/OwnableUpgradeable.sol";

contract OwnableUpgradeableWithInit is OwnableUpgradeable {
    constructor(address initialOwner) payable initializer {
        __Ownable_init(initialOwner);
    }
}
import "../access/Ownable2StepUpgradeable.sol";

contract Ownable2StepUpgradeableWithInit is Ownable2StepUpgradeable {
    constructor() payable initializer {
        __Ownable2Step_init();
    }
}
import "../account/extensions/draft-AccountERC7579Upgradeable.sol";

contract AccountERC7579UpgradeableWithInit is AccountERC7579Upgradeable {
    constructor() payable initializer {
        __AccountERC7579_init();
    }
}
import "../account/extensions/draft-AccountERC7579HookedUpgradeable.sol";

contract AccountERC7579HookedUpgradeableWithInit is AccountERC7579HookedUpgradeable {
    constructor() payable initializer {
        __AccountERC7579Hooked_init();
    }
}
import "../finance/VestingWalletUpgradeable.sol";

contract VestingWalletUpgradeableWithInit is VestingWalletUpgradeable {
    constructor(address beneficiary, uint64 startTimestamp, uint64 durationSeconds) payable initializer {
        __VestingWallet_init(beneficiary, startTimestamp, durationSeconds);
    }
}
import "../finance/VestingWalletCliffUpgradeable.sol";

contract VestingWalletCliffUpgradeableWithInit is VestingWalletCliffUpgradeable {
    constructor(uint64 cliffSeconds) payable initializer {
        __VestingWalletCliff_init(cliffSeconds);
    }
}
import "../governance/TimelockControllerUpgradeable.sol";

contract TimelockControllerUpgradeableWithInit is TimelockControllerUpgradeable {
    constructor(uint256 minDelay, address[] memory proposers, address[] memory executors, address admin) payable initializer {
        __TimelockController_init(minDelay, proposers, executors, admin);
    }
}
import "../metatx/ERC2771ContextUpgradeable.sol";

contract ERC2771ContextUpgradeableWithInit is ERC2771ContextUpgradeable {
    constructor(address trustedForwarder_) ERC2771ContextUpgradeable(trustedForwarder_) payable initializer {

    }
}
import "../metatx/ERC2771ForwarderUpgradeable.sol";

contract ERC2771ForwarderUpgradeableWithInit is ERC2771ForwarderUpgradeable {
    constructor(string memory name) payable initializer {
        __ERC2771Forwarder_init(name);
    }
}
import "./AccessManagedTargetUpgradeable.sol";

contract AccessManagedTargetUpgradeableWithInit is AccessManagedTargetUpgradeable {
    constructor() payable initializer {
        __AccessManagedTarget_init();
    }
}
import "./AccessManagerMockUpgradeable.sol";

contract AccessManagerMockUpgradeableWithInit is AccessManagerMockUpgradeable {
    constructor(address initialAdmin) payable initializer {
        __AccessManagerMock_init(initialAdmin);
    }
}
import "./account/AccountMockUpgradeable.sol";

contract AccountMockUpgradeableWithInit is AccountMockUpgradeable {
    constructor() payable initializer {
        __AccountMock_init();
    }
}
import "./account/AccountMockUpgradeable.sol";

contract AccountECDSAMockUpgradeableWithInit is AccountECDSAMockUpgradeable {
    constructor(address signerAddr) payable initializer {
        __AccountECDSAMock_init(signerAddr);
    }
}
import "./account/AccountMockUpgradeable.sol";

contract AccountP256MockUpgradeableWithInit is AccountP256MockUpgradeable {
    constructor(bytes32 qx, bytes32 qy) payable initializer {
        __AccountP256Mock_init(qx, qy);
    }
}
import "./account/AccountMockUpgradeable.sol";

contract AccountRSAMockUpgradeableWithInit is AccountRSAMockUpgradeable {
    constructor(bytes memory e, bytes memory n) payable initializer {
        __AccountRSAMock_init(e, n);
    }
}
import "./account/AccountMockUpgradeable.sol";

contract AccountERC7702MockUpgradeableWithInit is AccountERC7702MockUpgradeable {
    constructor() payable initializer {
        __AccountERC7702Mock_init();
    }
}
import "./account/AccountMockUpgradeable.sol";

contract AccountERC7702WithModulesMockUpgradeableWithInit is AccountERC7702WithModulesMockUpgradeable {
    constructor() payable initializer {
        __AccountERC7702WithModulesMock_init();
    }
}
import "./account/AccountMockUpgradeable.sol";

contract AccountERC7579MockUpgradeableWithInit is AccountERC7579MockUpgradeable {
    constructor(address validator, bytes memory initData) payable initializer {
        __AccountERC7579Mock_init(validator, initData);
    }
}
import "./account/AccountMockUpgradeable.sol";

contract AccountERC7579HookedMockUpgradeableWithInit is AccountERC7579HookedMockUpgradeable {
    constructor(address validator, bytes memory initData) payable initializer {
        __AccountERC7579HookedMock_init(validator, initData);
    }
}
import "./account/AccountMockUpgradeable.sol";

contract AccountMultiSignerMockUpgradeableWithInit is AccountMultiSignerMockUpgradeable {
    constructor(bytes[] memory signers, uint64 threshold) payable initializer {
        __AccountMultiSignerMock_init(signers, threshold);
    }
}
import "./account/AccountMockUpgradeable.sol";

contract AccountERC7913MockUpgradeableWithInit is AccountERC7913MockUpgradeable {
    constructor(bytes memory _signer) payable initializer {
        __AccountERC7913Mock_init(_signer);
    }
}
import "./account/modules/ERC7579MockUpgradeable.sol";

contract ERC7579ModuleMockUpgradeableWithInit is ERC7579ModuleMockUpgradeable {
    constructor(uint256 moduleTypeId) payable initializer {
        __ERC7579ModuleMock_init(moduleTypeId);
    }
}
import "./account/modules/ERC7579MockUpgradeable.sol";

contract ERC7579HookMockUpgradeableWithInit is ERC7579HookMockUpgradeable {
    constructor() payable initializer {
        __ERC7579HookMock_init();
    }
}
import "./account/modules/ERC7579MockUpgradeable.sol";

contract ERC7579FallbackHandlerMockUpgradeableWithInit is ERC7579FallbackHandlerMockUpgradeable {
    constructor() payable initializer {
        __ERC7579FallbackHandlerMock_init();
    }
}
import "./account/modules/ERC7579MockUpgradeable.sol";

contract ERC7579ValidatorMockUpgradeableWithInit is ERC7579ValidatorMockUpgradeable {
    constructor() payable initializer {
        __ERC7579ValidatorMock_init();
    }
}
import "./account/utils/ERC7579UtilsMockUpgradeable.sol";

contract ERC7579UtilsGlobalMockUpgradeableWithInit is ERC7579UtilsGlobalMockUpgradeable {
    constructor() payable initializer {
        __ERC7579UtilsGlobalMock_init();
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
import "./ArraysMockUpgradeable.sol";

contract BytesArraysMockUpgradeableWithInit is BytesArraysMockUpgradeable {
    constructor(bytes[] memory array) payable initializer {
        __BytesArraysMock_init(array);
    }
}
import "./ArraysMockUpgradeable.sol";

contract StringArraysMockUpgradeableWithInit is StringArraysMockUpgradeable {
    constructor(string[] memory array) payable initializer {
        __StringArraysMock_init(array);
    }
}
import "./AuthorityMockUpgradeable.sol";

contract NotAuthorityMockUpgradeableWithInit is NotAuthorityMockUpgradeable {
    constructor() payable initializer {
        __NotAuthorityMock_init();
    }
}
import "./AuthorityMockUpgradeable.sol";

contract AuthorityNoDelayMockUpgradeableWithInit is AuthorityNoDelayMockUpgradeable {
    constructor() payable initializer {
        __AuthorityNoDelayMock_init();
    }
}
import "./AuthorityMockUpgradeable.sol";

contract AuthorityDelayMockUpgradeableWithInit is AuthorityDelayMockUpgradeable {
    constructor() payable initializer {
        __AuthorityDelayMock_init();
    }
}
import "./AuthorityMockUpgradeable.sol";

contract AuthorityNoResponseUpgradeableWithInit is AuthorityNoResponseUpgradeable {
    constructor() payable initializer {
        __AuthorityNoResponse_init();
    }
}
import "./AuthorityMockUpgradeable.sol";

contract AuthorityObserveIsConsumingUpgradeableWithInit is AuthorityObserveIsConsumingUpgradeable {
    constructor() payable initializer {
        __AuthorityObserveIsConsuming_init();
    }
}
import "./Base64DirtyUpgradeable.sol";

contract Base64DirtyUpgradeableWithInit is Base64DirtyUpgradeable {
    constructor() payable initializer {
        __Base64Dirty_init();
    }
}
import "./BatchCallerUpgradeable.sol";

contract BatchCallerUpgradeableWithInit is BatchCallerUpgradeable {
    constructor() payable initializer {
        __BatchCaller_init();
    }
}
import "./CallReceiverMockUpgradeable.sol";

contract CallReceiverMockUpgradeableWithInit is CallReceiverMockUpgradeable {
    constructor() payable initializer {
        __CallReceiverMock_init();
    }
}
import "./CallReceiverMockUpgradeable.sol";

contract CallReceiverMockTrustingForwarderUpgradeableWithInit is CallReceiverMockTrustingForwarderUpgradeable {
    constructor(address trustedForwarder_) payable initializer {
        __CallReceiverMockTrustingForwarder_init(trustedForwarder_);
    }
}
import "./compound/CompTimelockUpgradeable.sol";

contract CompTimelockUpgradeableWithInit is CompTimelockUpgradeable {
    constructor(address admin_, uint256 delay_) payable initializer {
        __CompTimelock_init(admin_, delay_);
    }
}
import "./ConstructorMockUpgradeable.sol";

contract ConstructorMockUpgradeableWithInit is ConstructorMockUpgradeable {
    constructor(RevertType error) payable initializer {
        __ConstructorMock_init(error);
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
import "./docs/access-control/AccessControlERC20MintBaseUpgradeable.sol";

contract AccessControlERC20MintBaseUpgradeableWithInit is AccessControlERC20MintBaseUpgradeable {
    constructor(address minter) payable initializer {
        __AccessControlERC20MintBase_init(minter);
    }
}
import "./docs/access-control/AccessControlERC20MintMissingUpgradeable.sol";

contract AccessControlERC20MintMissingUpgradeableWithInit is AccessControlERC20MintMissingUpgradeable {
    constructor() payable initializer {
        __AccessControlERC20MintMissing_init();
    }
}
import "./docs/access-control/AccessControlERC20MintOnlyRoleUpgradeable.sol";

contract AccessControlERC20MintUpgradeableWithInit is AccessControlERC20MintUpgradeable {
    constructor(address minter, address burner) payable initializer {
        __AccessControlERC20Mint_init(minter, burner);
    }
}
import "./docs/access-control/AccessControlModifiedUpgradeable.sol";

contract AccessControlModifiedUpgradeableWithInit is AccessControlModifiedUpgradeable {
    constructor() payable initializer {
        __AccessControlModified_init();
    }
}
import "./docs/access-control/AccessManagedERC20MintBaseUpgradeable.sol";

contract AccessManagedERC20MintUpgradeableWithInit is AccessManagedERC20MintUpgradeable {
    constructor(address manager) payable initializer {
        __AccessManagedERC20Mint_init(manager);
    }
}
import "./docs/access-control/MyContractOwnableUpgradeable.sol";

contract MyContractUpgradeableWithInit is MyContractUpgradeable {
    constructor(address initialOwner) payable initializer {
        __MyContract_init(initialOwner);
    }
}
import "./docs/ERC20WithAutoMinerRewardUpgradeable.sol";

contract ERC20WithAutoMinerRewardUpgradeableWithInit is ERC20WithAutoMinerRewardUpgradeable {
    constructor() payable initializer {
        __ERC20WithAutoMinerReward_init();
    }
}
import "./docs/ERC4626FeesUpgradeable.sol";

contract ERC4626FeesUpgradeableWithInit is ERC4626FeesUpgradeable {
    constructor() payable initializer {
        __ERC4626Fees_init();
    }
}
import "./docs/governance/MyGovernorUpgradeable.sol";

contract MyGovernorUpgradeableWithInit is MyGovernorUpgradeable {
    constructor(
        IVotes _token,
        TimelockControllerUpgradeable _timelock
    ) payable initializer {
        __MyGovernor_init(_token, _timelock);
    }
}
import "./docs/governance/MyTokenUpgradeable.sol";

contract MyTokenUpgradeableWithInit is MyTokenUpgradeable {
    constructor() payable initializer {
        __MyToken_init();
    }
}
import "./docs/governance/MyTokenTimestampBasedUpgradeable.sol";

contract MyTokenTimestampBasedUpgradeableWithInit is MyTokenTimestampBasedUpgradeable {
    constructor() payable initializer {
        __MyTokenTimestampBased_init();
    }
}
import "./docs/governance/MyTokenWrappedUpgradeable.sol";

contract MyTokenWrappedUpgradeableWithInit is MyTokenWrappedUpgradeable {
    constructor(
        IERC20 wrappedToken
    ) payable initializer {
        __MyTokenWrapped_init(wrappedToken);
    }
}
import "./docs/MyNFTUpgradeable.sol";

contract MyNFTUpgradeableWithInit is MyNFTUpgradeable {
    constructor() payable initializer {
        __MyNFT_init();
    }
}
import "./docs/token/ERC1155/GameItemsUpgradeable.sol";

contract GameItemsUpgradeableWithInit is GameItemsUpgradeable {
    constructor() payable initializer {
        __GameItems_init();
    }
}
import "./docs/token/ERC1155/MyERC115HolderContractUpgradeable.sol";

contract MyERC115HolderContractUpgradeableWithInit is MyERC115HolderContractUpgradeable {
    constructor() payable initializer {
        __MyERC115HolderContract_init();
    }
}
import "./docs/token/ERC20/GLDTokenUpgradeable.sol";

contract GLDTokenUpgradeableWithInit is GLDTokenUpgradeable {
    constructor(uint256 initialSupply) payable initializer {
        __GLDToken_init(initialSupply);
    }
}
import "./docs/token/ERC6909/ERC6909GameItemsUpgradeable.sol";

contract ERC6909GameItemsUpgradeableWithInit is ERC6909GameItemsUpgradeable {
    constructor() payable initializer {
        __ERC6909GameItems_init();
    }
}
import "./docs/token/ERC721/GameItemUpgradeable.sol";

contract GameItemUpgradeableWithInit is GameItemUpgradeable {
    constructor() payable initializer {
        __GameItem_init();
    }
}
import "./docs/utilities/Base64NFTUpgradeable.sol";

contract Base64NFTUpgradeableWithInit is Base64NFTUpgradeable {
    constructor() payable initializer {
        __Base64NFT_init();
    }
}
import "./docs/utilities/MulticallUpgradeable.sol";

contract BoxUpgradeableWithInit is BoxUpgradeable {
    constructor() payable initializer {
        __Box_init();
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
import "./EIP712VerifierUpgradeable.sol";

contract EIP712VerifierUpgradeableWithInit is EIP712VerifierUpgradeable {
    constructor() payable initializer {
        __EIP712Verifier_init();
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
import "./ERC165/ERC165InterfacesSupportedUpgradeable.sol";

contract SupportsInterfaceWithLookupMockUpgradeableWithInit is SupportsInterfaceWithLookupMockUpgradeable {
    constructor() payable initializer {
        __SupportsInterfaceWithLookupMock_init();
    }
}
import "./ERC165/ERC165InterfacesSupportedUpgradeable.sol";

contract ERC165InterfacesSupportedUpgradeableWithInit is ERC165InterfacesSupportedUpgradeable {
    constructor(bytes4[] memory interfaceIds) payable initializer {
        __ERC165InterfacesSupported_init(interfaceIds);
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
import "./EtherReceiverMockUpgradeable.sol";

contract EtherReceiverMockUpgradeableWithInit is EtherReceiverMockUpgradeable {
    constructor() payable initializer {
        __EtherReceiverMock_init();
    }
}
import "./governance/GovernorCountingOverridableMockUpgradeable.sol";

contract GovernorCountingOverridableMockUpgradeableWithInit is GovernorCountingOverridableMockUpgradeable {
    constructor() payable initializer {
        __GovernorCountingOverridableMock_init();
    }
}
import "./governance/GovernorFractionalMockUpgradeable.sol";

contract GovernorFractionalMockUpgradeableWithInit is GovernorFractionalMockUpgradeable {
    constructor() payable initializer {
        __GovernorFractionalMock_init();
    }
}
import "./governance/GovernorMockUpgradeable.sol";

contract GovernorMockUpgradeableWithInit is GovernorMockUpgradeable {
    constructor() payable initializer {
        __GovernorMock_init();
    }
}
import "./governance/GovernorNoncesKeyedMockUpgradeable.sol";

contract GovernorNoncesKeyedMockUpgradeableWithInit is GovernorNoncesKeyedMockUpgradeable {
    constructor() payable initializer {
        __GovernorNoncesKeyedMock_init();
    }
}
import "./governance/GovernorPreventLateQuorumMockUpgradeable.sol";

contract GovernorPreventLateQuorumMockUpgradeableWithInit is GovernorPreventLateQuorumMockUpgradeable {
    constructor(uint256 quorum_) payable initializer {
        __GovernorPreventLateQuorumMock_init(quorum_);
    }
}
import "./governance/GovernorProposalGuardianMockUpgradeable.sol";

contract GovernorProposalGuardianMockUpgradeableWithInit is GovernorProposalGuardianMockUpgradeable {
    constructor() payable initializer {
        __GovernorProposalGuardianMock_init();
    }
}
import "./governance/GovernorSequentialProposalIdMockUpgradeable.sol";

contract GovernorSequentialProposalIdMockUpgradeableWithInit is GovernorSequentialProposalIdMockUpgradeable {
    constructor() payable initializer {
        __GovernorSequentialProposalIdMock_init();
    }
}
import "./governance/GovernorStorageMockUpgradeable.sol";

contract GovernorStorageMockUpgradeableWithInit is GovernorStorageMockUpgradeable {
    constructor() payable initializer {
        __GovernorStorageMock_init();
    }
}
import "./governance/GovernorSuperQuorumMockUpgradeable.sol";

contract GovernorSuperQuorumMockUpgradeableWithInit is GovernorSuperQuorumMockUpgradeable {
    constructor(uint256 quorum_, uint256 superQuorum_) payable initializer {
        __GovernorSuperQuorumMock_init(quorum_, superQuorum_);
    }
}
import "./governance/GovernorTimelockAccessMockUpgradeable.sol";

contract GovernorTimelockAccessMockUpgradeableWithInit is GovernorTimelockAccessMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockAccessMock_init();
    }
}
import "./governance/GovernorTimelockCompoundMockUpgradeable.sol";

contract GovernorTimelockCompoundMockUpgradeableWithInit is GovernorTimelockCompoundMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockCompoundMock_init();
    }
}
import "./governance/GovernorTimelockControlMockUpgradeable.sol";

contract GovernorTimelockControlMockUpgradeableWithInit is GovernorTimelockControlMockUpgradeable {
    constructor() payable initializer {
        __GovernorTimelockControlMock_init();
    }
}
import "./governance/GovernorVoteMockUpgradeable.sol";

contract GovernorVoteMocksUpgradeableWithInit is GovernorVoteMocksUpgradeable {
    constructor() payable initializer {
        __GovernorVoteMocks_init();
    }
}
import "./governance/GovernorVotesSuperQuorumFractionMockUpgradeable.sol";

contract GovernorVotesSuperQuorumFractionMockUpgradeableWithInit is GovernorVotesSuperQuorumFractionMockUpgradeable {
    constructor() payable initializer {
        __GovernorVotesSuperQuorumFractionMock_init();
    }
}
import "./governance/GovernorWithParamsMockUpgradeable.sol";

contract GovernorWithParamsMockUpgradeableWithInit is GovernorWithParamsMockUpgradeable {
    constructor() payable initializer {
        __GovernorWithParamsMock_init();
    }
}
import "./MerkleProofCustomHashMockUpgradeable.sol";

contract MerkleProofCustomHashMockUpgradeableWithInit is MerkleProofCustomHashMockUpgradeable {
    constructor() payable initializer {
        __MerkleProofCustomHashMock_init();
    }
}
import "./MerkleTreeMockUpgradeable.sol";

contract MerkleTreeMockUpgradeableWithInit is MerkleTreeMockUpgradeable {
    constructor() payable initializer {
        __MerkleTreeMock_init();
    }
}
import "./MulticallHelperUpgradeable.sol";

contract MulticallHelperUpgradeableWithInit is MulticallHelperUpgradeable {
    constructor() payable initializer {
        __MulticallHelper_init();
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
import "./proxy/UUPSUpgradeableMockUpgradeable.sol";

contract UUPSUnsupportedProxiableUUIDUpgradeableWithInit is UUPSUnsupportedProxiableUUIDUpgradeable {
    constructor() payable initializer {
        __UUPSUnsupportedProxiableUUID_init();
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
import "./ReentrancyTransientMockUpgradeable.sol";

contract ReentrancyTransientMockUpgradeableWithInit is ReentrancyTransientMockUpgradeable {
    constructor() payable initializer {
        __ReentrancyTransientMock_init();
    }
}
import "./StatelessUpgradeable.sol";

contract Dummy1234UpgradeableWithInit is Dummy1234Upgradeable {
    constructor() payable initializer {
        __Dummy1234_init();
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
import "./token/ERC1155ReceiverMockUpgradeable.sol";

contract ERC1155ReceiverMockUpgradeableWithInit is ERC1155ReceiverMockUpgradeable {
    constructor(bytes4 recRetval, bytes4 batRetval, RevertType error) payable initializer {
        __ERC1155ReceiverMock_init(recRetval, batRetval, error);
    }
}
import "./token/ERC1363ForceApproveMockUpgradeable.sol";

contract ERC1363ForceApproveMockUpgradeableWithInit is ERC1363ForceApproveMockUpgradeable {
    constructor() payable initializer {
        __ERC1363ForceApproveMock_init();
    }
}
import "./token/ERC1363NoReturnMockUpgradeable.sol";

contract ERC1363NoReturnMockUpgradeableWithInit is ERC1363NoReturnMockUpgradeable {
    constructor() payable initializer {
        __ERC1363NoReturnMock_init();
    }
}
import "./token/ERC1363ReceiverMockUpgradeable.sol";

contract ERC1363ReceiverMockUpgradeableWithInit is ERC1363ReceiverMockUpgradeable {
    constructor() payable initializer {
        __ERC1363ReceiverMock_init();
    }
}
import "./token/ERC1363ReturnFalseMockUpgradeable.sol";

contract ERC1363ReturnFalseOnERC20MockUpgradeableWithInit is ERC1363ReturnFalseOnERC20MockUpgradeable {
    constructor() payable initializer {
        __ERC1363ReturnFalseOnERC20Mock_init();
    }
}
import "./token/ERC1363ReturnFalseMockUpgradeable.sol";

contract ERC1363ReturnFalseMockUpgradeableWithInit is ERC1363ReturnFalseMockUpgradeable {
    constructor() payable initializer {
        __ERC1363ReturnFalseMock_init();
    }
}
import "./token/ERC1363SpenderMockUpgradeable.sol";

contract ERC1363SpenderMockUpgradeableWithInit is ERC1363SpenderMockUpgradeable {
    constructor() payable initializer {
        __ERC1363SpenderMock_init();
    }
}
import "./token/ERC20ApprovalMockUpgradeable.sol";

contract ERC20ApprovalMockUpgradeableWithInit is ERC20ApprovalMockUpgradeable {
    constructor() payable initializer {
        __ERC20ApprovalMock_init();
    }
}
import "./token/ERC20BridgeableMockUpgradeable.sol";

contract ERC20BridgeableMockUpgradeableWithInit is ERC20BridgeableMockUpgradeable {
    constructor(address bridge) payable initializer {
        __ERC20BridgeableMock_init(bridge);
    }
}
import "./token/ERC20DecimalsMockUpgradeable.sol";

contract ERC20DecimalsMockUpgradeableWithInit is ERC20DecimalsMockUpgradeable {
    constructor(uint8 decimals_) payable initializer {
        __ERC20DecimalsMock_init(decimals_);
    }
}
import "./token/ERC20ExcessDecimalsMockUpgradeable.sol";

contract ERC20ExcessDecimalsMockUpgradeableWithInit is ERC20ExcessDecimalsMockUpgradeable {
    constructor() payable initializer {
        __ERC20ExcessDecimalsMock_init();
    }
}
import "./token/ERC20FlashMintMockUpgradeable.sol";

contract ERC20FlashMintMockUpgradeableWithInit is ERC20FlashMintMockUpgradeable {
    constructor() payable initializer {
        __ERC20FlashMintMock_init();
    }
}
import "./token/ERC20ForceApproveMockUpgradeable.sol";

contract ERC20ForceApproveMockUpgradeableWithInit is ERC20ForceApproveMockUpgradeable {
    constructor() payable initializer {
        __ERC20ForceApproveMock_init();
    }
}
import "./token/ERC20GetterHelperUpgradeable.sol";

contract ERC20GetterHelperUpgradeableWithInit is ERC20GetterHelperUpgradeable {
    constructor() payable initializer {
        __ERC20GetterHelper_init();
    }
}
import "./token/ERC20MockUpgradeable.sol";

contract ERC20MockUpgradeableWithInit is ERC20MockUpgradeable {
    constructor() payable initializer {
        __ERC20Mock_init();
    }
}
import "./token/ERC20MulticallMockUpgradeable.sol";

contract ERC20MulticallMockUpgradeableWithInit is ERC20MulticallMockUpgradeable {
    constructor() payable initializer {
        __ERC20MulticallMock_init();
    }
}
import "./token/ERC20NoReturnMockUpgradeable.sol";

contract ERC20NoReturnMockUpgradeableWithInit is ERC20NoReturnMockUpgradeable {
    constructor() payable initializer {
        __ERC20NoReturnMock_init();
    }
}
import "./token/ERC20ReentrantUpgradeable.sol";

contract ERC20ReentrantUpgradeableWithInit is ERC20ReentrantUpgradeable {
    constructor() payable initializer {
        __ERC20Reentrant_init();
    }
}
import "./token/ERC20ReturnFalseMockUpgradeable.sol";

contract ERC20ReturnFalseMockUpgradeableWithInit is ERC20ReturnFalseMockUpgradeable {
    constructor() payable initializer {
        __ERC20ReturnFalseMock_init();
    }
}
import "./token/ERC20VotesAdditionalCheckpointsMockUpgradeable.sol";

contract ERC20VotesExtendedMockUpgradeableWithInit is ERC20VotesExtendedMockUpgradeable {
    constructor() payable initializer {
        __ERC20VotesExtendedMock_init();
    }
}
import "./token/ERC20VotesAdditionalCheckpointsMockUpgradeable.sol";

contract ERC20VotesExtendedTimestampMockUpgradeableWithInit is ERC20VotesExtendedTimestampMockUpgradeable {
    constructor() payable initializer {
        __ERC20VotesExtendedTimestampMock_init();
    }
}
import "./token/ERC20VotesLegacyMockUpgradeable.sol";

contract ERC20VotesLegacyMockUpgradeableWithInit is ERC20VotesLegacyMockUpgradeable {
    constructor() payable initializer {
        __ERC20VotesLegacyMock_init();
    }
}
import "./token/ERC20VotesTimestampMockUpgradeable.sol";

contract ERC20VotesTimestampMockUpgradeableWithInit is ERC20VotesTimestampMockUpgradeable {
    constructor() payable initializer {
        __ERC20VotesTimestampMock_init();
    }
}
import "./token/ERC20VotesTimestampMockUpgradeable.sol";

contract ERC721VotesTimestampMockUpgradeableWithInit is ERC721VotesTimestampMockUpgradeable {
    constructor() payable initializer {
        __ERC721VotesTimestampMock_init();
    }
}
import "./token/ERC4626LimitsMockUpgradeable.sol";

contract ERC4626LimitsMockUpgradeableWithInit is ERC4626LimitsMockUpgradeable {
    constructor() payable initializer {
        __ERC4626LimitsMock_init();
    }
}
import "./token/ERC4626MockUpgradeable.sol";

contract ERC4626MockUpgradeableWithInit is ERC4626MockUpgradeable {
    constructor(address underlying) payable initializer {
        __ERC4626Mock_init(underlying);
    }
}
import "./token/ERC4626OffsetMockUpgradeable.sol";

contract ERC4626OffsetMockUpgradeableWithInit is ERC4626OffsetMockUpgradeable {
    constructor(uint8 offset_) payable initializer {
        __ERC4626OffsetMock_init(offset_);
    }
}
import "./token/ERC4646FeesMockUpgradeable.sol";

contract ERC4626FeesMockUpgradeableWithInit is ERC4626FeesMockUpgradeable {
    constructor(
        uint256 entryFeeBasisPoints,
        address entryFeeRecipient,
        uint256 exitFeeBasisPoints,
        address exitFeeRecipient
    ) payable initializer {
        __ERC4626FeesMock_init(entryFeeBasisPoints, entryFeeRecipient, exitFeeBasisPoints, exitFeeRecipient);
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
        uint96 offset,
        address[] memory delegates,
        address[] memory receivers,
        uint96[] memory amounts
    ) payable initializer {
        __ERC721ConsecutiveMock_init(name, symbol, offset, delegates, receivers, amounts);
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
    constructor(bytes4 retval, RevertType error) payable initializer {
        __ERC721ReceiverMock_init(retval, error);
    }
}
import "./token/ERC721URIStorageMockUpgradeable.sol";

contract ERC721URIStorageMockUpgradeableWithInit is ERC721URIStorageMockUpgradeable {
    constructor() payable initializer {
        __ERC721URIStorageMock_init();
    }
}
import "./TransientSlotMockUpgradeable.sol";

contract TransientSlotMockUpgradeableWithInit is TransientSlotMockUpgradeable {
    constructor() payable initializer {
        __TransientSlotMock_init();
    }
}
import "./UpgradeableBeaconMockUpgradeable.sol";

contract UpgradeableBeaconMockUpgradeableWithInit is UpgradeableBeaconMockUpgradeable {
    constructor(address impl) payable initializer {
        __UpgradeableBeaconMock_init(impl);
    }
}
import "./UpgradeableBeaconMockUpgradeable.sol";

contract UpgradeableBeaconReentrantMockUpgradeableWithInit is UpgradeableBeaconReentrantMockUpgradeable {
    constructor() payable initializer {
        __UpgradeableBeaconReentrantMock_init();
    }
}
import "./utils/cryptography/ERC7739MockUpgradeable.sol";

contract ERC7739ECDSAMockUpgradeableWithInit is ERC7739ECDSAMockUpgradeable {
    constructor(address signerAddr) payable initializer {
        __ERC7739ECDSAMock_init(signerAddr);
    }
}
import "./utils/cryptography/ERC7739MockUpgradeable.sol";

contract ERC7739P256MockUpgradeableWithInit is ERC7739P256MockUpgradeable {
    constructor(bytes32 qx, bytes32 qy) payable initializer {
        __ERC7739P256Mock_init(qx, qy);
    }
}
import "./utils/cryptography/ERC7739MockUpgradeable.sol";

contract ERC7739RSAMockUpgradeableWithInit is ERC7739RSAMockUpgradeable {
    constructor(bytes memory e, bytes memory n) payable initializer {
        __ERC7739RSAMock_init(e, n);
    }
}
import "./VotesExtendedMockUpgradeable.sol";

contract VotesExtendedMockUpgradeableWithInit is VotesExtendedMockUpgradeable {
    constructor() payable initializer {
        __VotesExtendedMock_init();
    }
}
import "./VotesExtendedMockUpgradeable.sol";

contract VotesExtendedTimestampMockUpgradeableWithInit is VotesExtendedTimestampMockUpgradeable {
    constructor() payable initializer {
        __VotesExtendedTimestampMock_init();
    }
}
import "./VotesMockUpgradeable.sol";

contract VotesMockUpgradeableWithInit is VotesMockUpgradeable {
    constructor() payable initializer {
        __VotesMock_init();
    }
}
import "./VotesMockUpgradeable.sol";

contract VotesTimestampMockUpgradeableWithInit is VotesTimestampMockUpgradeable {
    constructor() payable initializer {
        __VotesTimestampMock_init();
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
import "../token/ERC1155/extensions/ERC1155BurnableUpgradeable.sol";

contract ERC1155BurnableUpgradeableWithInit is ERC1155BurnableUpgradeable {
    constructor() payable initializer {
        __ERC1155Burnable_init();
    }
}
import "../token/ERC1155/extensions/ERC1155PausableUpgradeable.sol";

contract ERC1155PausableUpgradeableWithInit is ERC1155PausableUpgradeable {
    constructor() payable initializer {
        __ERC1155Pausable_init();
    }
}
import "../token/ERC1155/extensions/ERC1155SupplyUpgradeable.sol";

contract ERC1155SupplyUpgradeableWithInit is ERC1155SupplyUpgradeable {
    constructor() payable initializer {
        __ERC1155Supply_init();
    }
}
import "../token/ERC1155/extensions/ERC1155URIStorageUpgradeable.sol";

contract ERC1155URIStorageUpgradeableWithInit is ERC1155URIStorageUpgradeable {
    constructor() payable initializer {
        __ERC1155URIStorage_init();
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
import "../token/ERC20/extensions/draft-ERC20TemporaryApprovalUpgradeable.sol";

contract ERC20TemporaryApprovalUpgradeableWithInit is ERC20TemporaryApprovalUpgradeable {
    constructor() payable initializer {
        __ERC20TemporaryApproval_init();
    }
}
import "../token/ERC20/extensions/ERC1363Upgradeable.sol";

contract ERC1363UpgradeableWithInit is ERC1363Upgradeable {
    constructor() payable initializer {
        __ERC1363_init();
    }
}
import "../token/ERC20/extensions/ERC20BurnableUpgradeable.sol";

contract ERC20BurnableUpgradeableWithInit is ERC20BurnableUpgradeable {
    constructor() payable initializer {
        __ERC20Burnable_init();
    }
}
import "../token/ERC20/extensions/ERC20CappedUpgradeable.sol";

contract ERC20CappedUpgradeableWithInit is ERC20CappedUpgradeable {
    constructor(uint256 cap_) payable initializer {
        __ERC20Capped_init(cap_);
    }
}
import "../token/ERC20/extensions/ERC20FlashMintUpgradeable.sol";

contract ERC20FlashMintUpgradeableWithInit is ERC20FlashMintUpgradeable {
    constructor() payable initializer {
        __ERC20FlashMint_init();
    }
}
import "../token/ERC20/extensions/ERC20PausableUpgradeable.sol";

contract ERC20PausableUpgradeableWithInit is ERC20PausableUpgradeable {
    constructor() payable initializer {
        __ERC20Pausable_init();
    }
}
import "../token/ERC20/extensions/ERC20PermitUpgradeable.sol";

contract ERC20PermitUpgradeableWithInit is ERC20PermitUpgradeable {
    constructor(string memory name) payable initializer {
        __ERC20Permit_init(name);
    }
}
import "../token/ERC20/extensions/ERC20VotesUpgradeable.sol";

contract ERC20VotesUpgradeableWithInit is ERC20VotesUpgradeable {
    constructor() payable initializer {
        __ERC20Votes_init();
    }
}
import "../token/ERC20/extensions/ERC20WrapperUpgradeable.sol";

contract ERC20WrapperUpgradeableWithInit is ERC20WrapperUpgradeable {
    constructor(IERC20 underlyingToken) payable initializer {
        __ERC20Wrapper_init(underlyingToken);
    }
}
import "../token/ERC20/extensions/ERC4626Upgradeable.sol";

contract ERC4626UpgradeableWithInit is ERC4626Upgradeable {
    constructor(IERC20 asset_) payable initializer {
        __ERC4626_init(asset_);
    }
}
import "../token/ERC6909/draft-ERC6909Upgradeable.sol";

contract ERC6909UpgradeableWithInit is ERC6909Upgradeable {
    constructor() payable initializer {
        __ERC6909_init();
    }
}
import "../token/ERC6909/extensions/draft-ERC6909ContentURIUpgradeable.sol";

contract ERC6909ContentURIUpgradeableWithInit is ERC6909ContentURIUpgradeable {
    constructor() payable initializer {
        __ERC6909ContentURI_init();
    }
}
import "../token/ERC6909/extensions/draft-ERC6909MetadataUpgradeable.sol";

contract ERC6909MetadataUpgradeableWithInit is ERC6909MetadataUpgradeable {
    constructor() payable initializer {
        __ERC6909Metadata_init();
    }
}
import "../token/ERC6909/extensions/draft-ERC6909TokenSupplyUpgradeable.sol";

contract ERC6909TokenSupplyUpgradeableWithInit is ERC6909TokenSupplyUpgradeable {
    constructor() payable initializer {
        __ERC6909TokenSupply_init();
    }
}
import "../token/ERC721/ERC721Upgradeable.sol";

contract ERC721UpgradeableWithInit is ERC721Upgradeable {
    constructor(string memory name_, string memory symbol_) payable initializer {
        __ERC721_init(name_, symbol_);
    }
}
import "../token/ERC721/extensions/ERC721BurnableUpgradeable.sol";

contract ERC721BurnableUpgradeableWithInit is ERC721BurnableUpgradeable {
    constructor() payable initializer {
        __ERC721Burnable_init();
    }
}
import "../token/ERC721/extensions/ERC721ConsecutiveUpgradeable.sol";

contract ERC721ConsecutiveUpgradeableWithInit is ERC721ConsecutiveUpgradeable {
    constructor() payable initializer {
        __ERC721Consecutive_init();
    }
}
import "../token/ERC721/extensions/ERC721EnumerableUpgradeable.sol";

contract ERC721EnumerableUpgradeableWithInit is ERC721EnumerableUpgradeable {
    constructor() payable initializer {
        __ERC721Enumerable_init();
    }
}
import "../token/ERC721/extensions/ERC721PausableUpgradeable.sol";

contract ERC721PausableUpgradeableWithInit is ERC721PausableUpgradeable {
    constructor() payable initializer {
        __ERC721Pausable_init();
    }
}
import "../token/ERC721/extensions/ERC721RoyaltyUpgradeable.sol";

contract ERC721RoyaltyUpgradeableWithInit is ERC721RoyaltyUpgradeable {
    constructor() payable initializer {
        __ERC721Royalty_init();
    }
}
import "../token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";

contract ERC721URIStorageUpgradeableWithInit is ERC721URIStorageUpgradeable {
    constructor() payable initializer {
        __ERC721URIStorage_init();
    }
}
import "../token/ERC721/extensions/ERC721VotesUpgradeable.sol";

contract ERC721VotesUpgradeableWithInit is ERC721VotesUpgradeable {
    constructor() payable initializer {
        __ERC721Votes_init();
    }
}
import "../token/ERC721/extensions/ERC721WrapperUpgradeable.sol";

contract ERC721WrapperUpgradeableWithInit is ERC721WrapperUpgradeable {
    constructor(IERC721 underlyingToken) payable initializer {
        __ERC721Wrapper_init(underlyingToken);
    }
}
import "../token/ERC721/utils/ERC721HolderUpgradeable.sol";

contract ERC721HolderUpgradeableWithInit is ERC721HolderUpgradeable {
    constructor() payable initializer {
        __ERC721Holder_init();
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
import "../utils/cryptography/signers/MultiSignerERC7913Upgradeable.sol";

contract MultiSignerERC7913UpgradeableWithInit is MultiSignerERC7913Upgradeable {
    constructor() payable initializer {
        __MultiSignerERC7913_init();
    }
}
import "../utils/cryptography/signers/SignerECDSAUpgradeable.sol";

contract SignerECDSAUpgradeableWithInit is SignerECDSAUpgradeable {
    constructor() payable initializer {
        __SignerECDSA_init();
    }
}
import "../utils/cryptography/signers/SignerERC7913Upgradeable.sol";

contract SignerERC7913UpgradeableWithInit is SignerERC7913Upgradeable {
    constructor() payable initializer {
        __SignerERC7913_init();
    }
}
import "../utils/cryptography/signers/SignerP256Upgradeable.sol";

contract SignerP256UpgradeableWithInit is SignerP256Upgradeable {
    constructor() payable initializer {
        __SignerP256_init();
    }
}
import "../utils/cryptography/signers/SignerRSAUpgradeable.sol";

contract SignerRSAUpgradeableWithInit is SignerRSAUpgradeable {
    constructor() payable initializer {
        __SignerRSA_init();
    }
}
import "../utils/cryptography/verifiers/ERC7913P256VerifierUpgradeable.sol";

contract ERC7913P256VerifierUpgradeableWithInit is ERC7913P256VerifierUpgradeable {
    constructor() payable initializer {
        __ERC7913P256Verifier_init();
    }
}
import "../utils/cryptography/verifiers/ERC7913RSAVerifierUpgradeable.sol";

contract ERC7913RSAVerifierUpgradeableWithInit is ERC7913RSAVerifierUpgradeable {
    constructor() payable initializer {
        __ERC7913RSAVerifier_init();
    }
}
import "../utils/introspection/ERC165Upgradeable.sol";

contract ERC165UpgradeableWithInit is ERC165Upgradeable {
    constructor() payable initializer {
        __ERC165_init();
    }
}
import "../utils/MulticallUpgradeable.sol";

contract MulticallUpgradeableWithInit is MulticallUpgradeable {
    constructor() payable initializer {
        __Multicall_init();
    }
}
import "../utils/NoncesUpgradeable.sol";

contract NoncesUpgradeableWithInit is NoncesUpgradeable {
    constructor() payable initializer {
        __Nonces_init();
    }
}
import "../utils/NoncesKeyedUpgradeable.sol";

contract NoncesKeyedUpgradeableWithInit is NoncesKeyedUpgradeable {
    constructor() payable initializer {
        __NoncesKeyed_init();
    }
}
import "../utils/PausableUpgradeable.sol";

contract PausableUpgradeableWithInit is PausableUpgradeable {
    constructor() payable initializer {
        __Pausable_init();
    }
}
import "../utils/ReentrancyGuardUpgradeable.sol";

contract ReentrancyGuardUpgradeableWithInit is ReentrancyGuardUpgradeable {
    constructor() payable initializer {
        __ReentrancyGuard_init();
    }
}
import "../utils/ReentrancyGuardTransientUpgradeable.sol";

contract ReentrancyGuardTransientUpgradeableWithInit is ReentrancyGuardTransientUpgradeable {
    constructor() payable initializer {
        __ReentrancyGuardTransient_init();
    }
}
