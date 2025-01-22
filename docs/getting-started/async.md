---
label: Async - Pull
order: -99
icon: dependabot
expanded: false
---

# Getting Started - Asynchronous Oracle - EVM 

The **FOInterfaceV1** contract provides an interface for interacting with the **asynchronous (pull)** version of the **Fact Oracle**, where data requests are made off-chain and processed asynchronously. This guide explains how to use the interface to request data feeds, process responses, and ensure best practices when working with Fact Oracle services.


## Prerequisites
[!file](/static/FOInterfaceV1.sol)


## Installation

1. Import the Interface:  
   Include the FOInterfaceV1.sol file in your Solidity project:
   ```solidity
   import "./FOInterfaceV1.sol";
   ```

2. Contract Initialization:  
   Obtain the address of a contract that implements the FOInterfaceV1 interface from the [chain list](/chains/).


## Usage

### Interacting with FOInterfaceV1

1. Initialization
   Set up your contract with the Fact Oracle address:
   ```solidity
   constructor(address _oracle) {
       fOracle = FOInterfaceV1(_oracle);
   }
   ```

2. Methods

   **requestAsyncData():** Submit a request to the Oracle for a specific data feed.  
   - **Parameters:**
     - `code` (uint16): The identification code of the feed. Codes for various feeds can be found at [/data](/data).
     - `request` (bytes): Encoded parameters for the Oracle request, allowing additional details to be included. Examples:
       - **Real Estate:** Apartment register number.
       - **Weather:** City name.
       - **Car Insurance:** Car builder, model, and year.
   - **Output:**
     - `transactionId` (uint128): A unique identifier for tracking the request.

   **Example Request Encoding in JavaScript:**
   ```javascript
   // Request car builder, model, and year
   const carRequest = new ethers.AbiCoder().encode(
       ["string", "string", "uint128"],
       ["vw", "golf", 2021]
   );
   ```

   - **Example Solidity Function:**
   ```solidity
   function requestData(uint16 code, bytes calldata request) public {
       uint128 transactionId = fOracle.requestAsyncData(code, request);
       emit RequestSent(transactionId, code);
   }
   ```

   **Oracle Callbacks:**
   The response can be received in two formats: `DataPackage` or binary.

   - **DataPackage Format:**
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

     /// @notice Callback function to receive the data feed from the oracle
     function OracleDataCallback(uint128 transactionId, uint16 code, DataPackage calldata dataPackage) external onlyOracle {
         // Process DataPackage here
     }
     ```

   - **Binary Format:**
     ```solidity
     struct RealEstateAsset {
         uint16 size;
         uint8 bedrooms;
         uint8 bathrooms;
         uint8 parkingSpaces;
         uint16 yearBuilt;
         uint128 price;
         uint128 latitude;
         uint128 longitude;
         address tokenAddress;
     }

     /// @notice Callback function to receive the data feed from the oracle
     function OracleBytesCallback(uint128 transactionId, uint16 code, bytes calldata response) external onlyOracle {
         if (transactionId == _transactionId) {
             RealEstateAsset memory _realEstate = abi.decode(response, (RealEstateAsset));
             // Handle the decoded real estate data
         }
     }
     ```


### Subscription Model
The Fact Oracle requires a subscription to access its services. 

To subscribe and access licensed data, please contact us at projects@fact.finance.


### Best Practices

1. **Restrict Oracle Updates:**  
   Always use a restricted modifier (e.g., `onlyOwner`) to update the oracle address securely.
   ```solidity
   function updateOracle(address _oracle) public onlyOwner {  
       fOracle = FOInterfaceV1(_oracle);
   }
   ```

2. **Track Requests:**  
   Keep a mapping of `transactionId` to track the status of each request and avoid processing the same response multiple times.

3. **Validate Freshness:**  
   Ensure data retrieved from the oracle is not expired by comparing `data.updatedAt` with the current block timestamp.  

4. **Handle Confidence Levels:**  
   Implement logic to treat `confidence` appropriately. For example:  
   - Reject feeds with `confidence = 0`.  
   - Use stricter rules for `confidence = 5`.  
   - Fully trust data with `confidence = 95`.

5. **Use Decimals and Info Correctly:**  
   Always factor in `decimal` when calculating or displaying the data value. Decode `info` for additional metadata as needed.


With these steps and best practices, you can seamlessly integrate Fact Oracle services into your smart contracts while ensuring security, accuracy, and efficiency. For further assistance, check the FAQ or contact our support team.


