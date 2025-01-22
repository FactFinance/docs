---
label: dApp - Hash 
order: -003
icon: codescan
expanded: false
---

# Getting Started - DApp Oracle

The **DApp Oracle** is a hybrid model that combines the best features of synchronous (push) and asynchronous (pull) systems. In this model, a customer’s DApp requests data directly from the Fact Finance API service, which provides the data in a signed package. The data feed includes a cryptographic hash that the oracle confirms on-chain, ensuring data integrity and accuracy.


## Overview
The DApp Oracle workflow ensures trust by allowing users to interact with both decentralized applications (DApps) and smart contracts while maintaining data security and transparency. Here’s how it works:

1. The DApp requests a data package using the Fact Finance API.
2. The API returns a `DataPackage` containing the requested data and a cryptographic hash.
3. The DApp sends the `DataPackage` to the smart contract.
4. The smart contract verifies the hash on-chain using the oracle.


## API Request
To request data, make an HTTP GET request to the following endpoint:
```
https://api.fact.finance/get/[code]
```

- **[code]:** The unique identifier for the data feed.

### Example API Request
For example, to request a data package for a specific code:
```
https://api.fact.finance/get/12345
```


## DataPackage Format
The API returns a `DataPackage` in the following format:

```solidity
struct DataPackage {
    uint16 code;            /// @dev Unique identifier or code for the data feed.
    uint16 licenseGroup;    /// @dev Identifier for the license group associated with this data feed.
    int128 value;           /// @dev Integer value of the data feed, representing the main metric or value.
    uint64 updatedAt;       /// @dev Timestamp (in seconds) when the backend last updated this data feed.
    uint8 decimal;          /// @dev Number of decimal places for the data value (e.g., 2 for cents, 6 for micro-units).
    uint8 confidence;       /// @dev Confidence level of the data feed (0: outlier, 5: acceptable, 95: highly reliable).
    bytes6 info;            /// @dev Encoded additional information about the data feed (e.g., metadata or tags).
    bytes msgHash;          /// @dev Hash of the data package, used for signature validation.
}
```

### Example DataPackage
```json
{
  "code": 12345,
  "licenseGroup": 1,
  "value": 100,
  "updatedAt": 1672531200,
  "decimal": 2,
  "confidence": 95,
  "info": "0x1234567890ab",
  "msgHash": "0xabcd...ef12"
}
```


## Smart Contract Integration
To ensure the integrity of the data, the `DataPackage` should be validated on-chain using the `verifyDappData` function provided by the Fact Oracle contract.

### On-Chain Verification
The oracle provides a method to verify the data hash:
```solidity
/// @notice Verifies the signature of a data package received from the Fact Finance API.
/// @param dataPackage The DataPackage containing feed information and its signature hash.
/// @return isValid Indicates whether the signature is valid.
function verifyDappData(DataPackage calldata dataPackage) public view returns (bool isValid) {
    isValid = _checkSignature(dataPackage);
}
```

### Example Integration
```solidity
function validateDataPackage(DataPackage calldata dataPackage) public {
    require(oracle.verifyDappData(dataPackage), "Data modified by the user");
    // Process the valid data package
}
```


## Best Practices

1. **Use the API Endpoint Securely:**
   Always ensure your DApp communicates with the Fact Finance API over HTTPS.

2. **Verify Data On-Chain:**
   Always validate the `msgHash` of the `DataPackage` on-chain to ensure the data has not been tampered with.

3. **Check Data Freshness:**
   Compare the `updatedAt` field in the `DataPackage` with the current block timestamp to ensure the data is still valid.

4. **Handle Confidence Levels Appropriately:**
   Implement logic to handle `confidence` values in the `DataPackage`. For example:
   - Reject packages with `confidence = 0`.
   - Use caution with `confidence = 5`.
   - Fully trust packages with `confidence = 95`.


By following these steps, you can integrate the DApp Oracle into your smart contracts to ensure secure, accurate, and trustworthy data interactions. For more information, contact us at **projects@fact.finance**.

