---
label: Getting Started
order: -100
icon: rocket
expanded: false
---

# Getting Started - EVM

The **FOInterfaceV1** contract provides an interface for interacting with the **push** version of the **Fact Oracle**. This guide explains how to use the interface to retrieve data feeds, manage subscriptions, and ensure best practices when working with Fact Oracle services.


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
    int256 value;        /// @dev Integer value of the data feed
    uint256 updatedAt;   /// @dev Timestamp of the last data update
    uint8 decimal;       /// @dev Number of decimal places for interpreting the value
    uint8 confidence;    /// @dev Confidence level of the data feed
                         /// @dev 0: outlier, 5: acceptable, 95: reliable
}
```

Explanation:
1. `value`:  
- The raw integer data from the oracle. To derive the actual value, multiply `value` by `10^-decimal`.  
- Example: If `value = 12345` and `decimal = 2`, the actual value is `123.45`.
2. `updatedAt`:  
- The timestamp indicating when the data was last updated.  
- Important: Use this to verify the freshness of the data and ensure it hasn't expired before using it in smart contracts.

3. `decimal`:  
- Indicates how many decimal places the `value` needs for interpretation.  

4. `confidence`:  
- Represents the reliability of the data feed:  
  - `0`: Outlier (use with caution).  
  - `5`: Acceptable (mild volatility).  
  - `95`: Reliable (highly trustworthy).


### Interacting with FOInterfaceV1

1. Initialization
   Set up your contract with the Fact Oracle address:
   ```solidity
   constructor(address _oracle) {
       fOracle = FOInterfaceV1(_oracle);
   }
   ```

2. Methods

   **getFeed():** Retrieve the latest data feed for a specific `code`.  
   Example:
   ```solidity
   function getFeed(uint8 _code) public {
       DataFeed memory data = fOracle.getFeed(_code); 
       // Calculate actual value
       int256 actualValue = data.value * int256(10 ** data.decimal);
       // Check if data is fresh
       require(block.timestamp - data.updatedAt < 3600, "Data expired"); // 1-hour limit
   }
   ```


### Subscription
Some Fact Oracle services require a subscription. To subscribe, provide the contract address and your project name:

```solidity
function subscribeOracle(address _contractAddress, string calldata _projectName) public {
    fOracle.subscribeOracle(_contractAddress, _projectName);
}
```


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
