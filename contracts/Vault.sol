// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.19;

import {SchemaResolver} from "@ethereum-attestation-service/eas-contracts/contracts/resolver/SchemaResolver.sol";
import {Attestation} from "@ethereum-attestation-service/eas-contracts/contracts/Common.sol";
import {IEAS} from "@ethereum-attestation-service/eas-contracts/contracts/IEAS.sol";

contract VaultResolver is SchemaResolver {
    constructor(address eas, address _atteser) SchemaResolver(IEAS(eas)) {
        attester = _atteser;
    }

    address public attester;

    /// @notice A resolver callback that should be implemented by child contracts.
    /// @param attestation The new attestation.
    /// @param value An explicit ETH amount that was sent to the resolver. Please note that this value is verified in
    ///     both attest() and multiAttest() callbacks EAS-only callbacks and that in case of multi attestations, it'll
    ///     usually hold that msg.value != value, since msg.value aggregated the sent ETH amounts for all the
    ///     attestations in the batch.
    /// @return Whether the attestation is valid.

    function onAttest(
        Attestation calldata attestation,
        uint256 value
    ) internal virtual override returns (bool) {
        return true;
    }

    /// @notice Processes an attestation revocation and verifies if it can be revoked.
    /// @param attestation The existing attestation to be revoked.
    /// @param value An explicit ETH amount that was sent to the resolver. Please note that this value is verified in
    ///     both revoke() and multiRevoke() callbacks EAS-only callbacks and that in case of multi attestations, it'll
    ///     usually hold that msg.value != value, since msg.value aggregated the sent ETH amounts for all the
    ///     attestations in the batch.
    /// @return Whether the attestation can be revoked.
    function onRevoke(
        Attestation calldata attestation,
        uint256 value
    ) internal virtual override returns (bool) {
        return true;
    }
}
