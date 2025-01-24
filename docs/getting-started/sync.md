---
label: Sync - Push
order: -001
icon: rocket
expanded: false
---
# Getting Started - EVM

The **FOInterfaceV1** contract provides an interface for interacting with the **synchronous (push)** version of the **Fact Oracle**, where data is periodically updated on-chain. This guide explains how to use the interface to retrieve data feeds, manage subscriptions, and ensure best practices when working with Fact Oracle services.


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

### Return Type - DataFeed Struct
The `DataFeed` struct represents the oracle data feed, including the value, confidence score, and metadata for interpretation. This is how the data is structured:

```solidity
/// @title Data Feed Struct
/// @notice Represents the data feed with a value, timestamp, and confidence level
/// @dev Stores oracle data with additional metadata for reliability and scaling
struct DataFeed {
    int128 value;        /// @dev Integer value of the data feed, representing the main metric or value.
    uint64 updatedAt;    /// @dev Timestamp (in seconds) when the backend last updated this data feed.
    uint8 decimal;       /// @dev Number of decimal places for the data value (e.g., 2 for cents, 6 for micro-units).
    uint8 confidence;    /// @dev Confidence level of the data feed (0: outlier, 5: acceptable, 95: highly reliable).
    bytes6 info;         /// @dev Encoded additional information about the data feed (e.g., metadata or tags).
}
```

Explanation:
1. `value`:  
- The raw integer data from the oracle. To derive the actual value, multiply `value` by `10^-decimal`.  
- Example: If `value = 12345` and `decimal = 2`, the actual value is `123.45`.

2. `updatedAt`:  
- The timestamp indicating when the data was last updated.  
- Important: Use this to verify the freshness of the data and ensure it hasn’t expired before using it in smart contracts.

3. `decimal`:  
- Indicates how many decimal places the `value` needs for interpretation.  

4. `confidence`:  
- Represents the reliability of the data feed:  
  - `0`: Outlier (use with caution).  
  - `5`: Acceptable (mild volatility).  
  - `95`: Reliable (highly trustworthy).

5. `info`:  
- Encoded extra information about the data feed, which can contain metadata or tags. For example:
  - For a **CPI (Consumer Price Index)** feed, `info` might include the month, last 12 months, and last change.
  - For a **Weather** feed, `info` might include max, min, temperature, humidity, and wind speed.

**Example Usage in Solidity:**
```solidity

 /*  Oracle Usage */
 /// Retrieves the latest data feed from the oracle and updates contract state variables
 function getSyncData(uint16 code) public {
     _data = _fOracle.getSyncData(code);
     _weatherDetail = abi.decode(_data.info, (Weather));
            
 }

DataFeed public _data;
Weather public _weatherDetail

struct Weather {
    int8 min;
    int8 max;
    int8 humidity;
    int8 windSpeed;
}

```


### Interacting with FOInterfaceV1

1. Initialization
   Set up your contract with the Fact Oracle address:
   ```solidity
   constructor(address _oracle) {
       fOracle = FOInterfaceV1(_oracle);
   }
   ```

2. Methods

   **getSyncData():** Retrieve the latest data feed for a specific `code`.  
   - **Parameter:**
     - `code` (uint16): The identification code of the feed. Codes for various feeds can be found at [/datafeed](/data).
   - **Example:**
   ```solidity
   function getSyncData(uint16 code) public {
       DataFeed memory data = fOracle.getSyncData(code); 
       // Calculate actual value
       int256 actualValue = data.value * int256(10 ** data.decimal);
       // Check if data is fresh
       require(block.timestamp - data.updatedAt < 3600, "Data expired"); // 1-hour limit
   }
   ```


### Freemium Oracle Model
The Fact Oracle operates on a freemium model. Most data feeds, such as economic indices and public data, are free to access. Licensed data feeds require a subscription. 

To subscribe and access licensed data, please contact us at **projects@fact.finance**.


### Best Practices

1. **Restrict Oracle Updates:**  
   Always use a restricted modifier (e.g., `onlyOwner`) to update the oracle address securely.
   ```solidity
   function updateOracle(address _oracle) public onlyOwner {  
       fOracle = FOInterfaceV1(_oracle);
   }
   ```

2. **Validate Freshness:**  
   Ensure data retrieved from the oracle is not expired by comparing `data.updatedAt` with the current block timestamp.  

3. **Handle Confidence Levels:**  
   Implement logic to treat `confidence` appropriately. For example:  
   - Reject feeds with `confidence = 0`.  
   - Use stricter rules for `confidence = 5`.  
   - Fully trust data with `confidence = 95`.


4. **Use Decimals Correctly:**  
   Always factor in `decimal` when calculating or displaying the data value.


With these steps and best practices, you can seamlessly integrate Fact Oracle services into your smart contracts while ensuring security, accuracy, and efficiency. For further assistance, check the FAQ or contact our support team.



