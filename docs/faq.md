---
label: F.A.Q
order: -1001
icon: question
visibility: hidden
---

# Frequently Asked Questions
Here you’ll find answers to the most common questions about using the Fact Finance Oracle. If you have additional questions, feel free to contact our team.

## General Questions
==- 1. What is Fact Finance Oracle (FO) and how does it work?
Fact Finance Oracle is a push-based oracle solution designed to provide reliable and verifiable data feeds directly to smart contracts. It ensures data accuracy, freshness, and integrity using confidence scoring and timestamp validation.

==- 2. What is the purpose of the FOInterfaceV1 contract?
FOInterfaceV1 is the primary interface for integrating Fact Finance Oracle with your Solidity smart contracts. It allows you to retrieve data feeds, manage subscriptions, and ensure secure interactions with oracle services.

===

## Data Feed 
==- 3. What is the DataFeed struct, and what fields does it include?
The DataFeed struct represents the oracle data feed. It includes the following fields:
- `value`: The raw integer data.
- `updatedAt`: A timestamp indicating when the data was last updated.
- `decimal`: The number of decimal places for scaling the value.
- `confidence`: A score indicating the reliability of the data (1 = reliable, 2 = acceptable, 3 = outlier).

==- 4. How do I calculate the actual value from a data feed?
Use the formula:
For example, if `value` = 12345 and `decimal` = 2, the actual value is 123.45.


==- 5. How can I validate the freshness of a data feed?
To ensure the data retrieved from the oracle is still relevant, always check the updatedAt timestamp in the DataFeed struct against the current block timestamp (block.timestamp). The acceptable freshness threshold depends on the type of data being used.

Examples:
1.	Monthly Economic Index (e.g., Inflation):
For economic indices like inflation, which are typically updated monthly, you can set a threshold of 30 days (2592000 seconds):

```solidity
require(block.timestamp - data.updatedAt < 2592000, "Data is outdated");
```

2.	Foreign Exchange Rates (Forex):
For highly volatile data like forex rates, where updates are more frequent, you can use a 1-hour threshold (3600 seconds):

```solidity
require(block.timestamp - data.updatedAt < 3600, "Data is outdated");
```

By customizing the freshness threshold to the specific data type, you can ensure that your smart contract operates with accurate and up-to-date information. Always adapt the threshold to the expected update frequency of the data feed.

==- 6. How should I handle the confidence field?

The confidence field in the DataFeed struct indicates the reliability of the data. Handling this value correctly ensures that your smart contract responds appropriately to data quality.

Confidence Levels:

Reliable
:	The data is trustworthy and can be used immediately without additional precautions.

Acceptable
:	The data is usable but may show mild volatility. You should apply safeguards or adjust operations accordingly.

Outlier
:	The data is significantly deviated and should be treated with caution, potentially rejected outright.

Examples of Handling Confidence Levels:
1.	Outlier (`3`):
Scenario: A lending platform detects an outlier in asset pricing. To protect users, it limits withdrawal amounts until the data is verified or updated.

```solidity
if (data.confidence == 3) {
    revert("Data is classified as an outlier. Action restricted.");
}
```

2.	Acceptable (`2`):
Scenario: A stablecoin protocol detects acceptable volatility in forex data. To mitigate risk, it increases the spread for transactions temporarily.

```solidity
if (data.confidence == 2) {
    adjustSpread(); // Implement logic to increase the spread
}
```

3.	Reliable (`1`):
Scenario: When the data is reliable, the protocol proceeds with standard operations.

```solidity
if (data.confidence == 1) {
    processTransaction(); // Normal operations
}
```
By implementing logic for each confidence level, you can ensure that your protocol adapts dynamically to the quality of the data provided by the oracle.

==- 7. What are the data feeds available?
Fact Finance Oracle provides RWA data, including:
- Economic indices
- Real estate data
- Proof of reserve information

Check the full list of available data feeds [here](/datafeed/).

===

## Subscription 
==- 8.	Do I need a subscription to access Fact Oracle data feeds?
Yes, certain licensed data feeds require a subscription to use on the mainnet. You can subscribe by providing the contract address and your project name through the subscribeOracle method.

==- 9.	How do I subscribe to a licensed data feed?
Use the following Solidity function:
```solidity
function subscribeOracle(address _contractAddress, string calldata _projectName) public {
    fOracle.subscribeOracle(_contractAddress, _projectName);
}
```

===

## Additional Questions

==- 10. Which blockchains are supported by Fact Finance Oracle?
Fact Finance Oracle supports EVM-compatible chains and SVN chains, including both mainnets and testnets.
You can check the available chains and their respective contract addresses [here](/chains/).

==- 11.	How do I securely update the oracle contract address?
Use an onlyOwner modifier to ensure only the contract owner can update the oracle address:

```solidity
function updateOracle(address _oracle) public onlyOwner {
    fOracle = FOInterfaceV1(_oracle);
}
```

===

## Troubleshooting 
==- 12.	Why am I getting outdated data from the oracle?
Check the updatedAt timestamp in the DataFeed struct. If the timestamp indicates the data is expired, the oracle may not have updated the feed recently. Ensure your acceptable freshness threshold is properly validated in your contract logic.

==- 13.	What happens if my subscription is not active?
Without an active subscription, you will not have access to licensed data feeds on the mainnet. Ensure you’ve subscribed to the required feeds using the provided method.

===

For any additional questions or assistance, feel free to reach out — we’re here to help! support@fact.finance

