---
label: Proof of Reserve
order: -001
icon: project-roadmap
---

# Proof of Reserve Interface

The FOInterfaceV1 contract provides an interface for interacting with the **push** Proof of Reserve Fact Oracle (FO). 

This guide outlines how to use the interface to retrieve data feeds and manage subscriptions.

### Prerequisites
[!file Solidity Fact Oracle Interface file](/static/FOInterfaceV1.sol)


### Installation

Import the Interface: Ensure you have imported FOInterfaceV1.sol into your Solidity project.

```solidity
import "./FOInterfaceV1.sol";
```

Contract Initialization: Obtain the address of a contract that implements FOInterfaceV1 at https://fact.finance.

### Usage

```solidity
// Proof of Reserve Asset
struct DataAsset {
    uint256 value;
    uint256 updatedAt;
    uint8 decimal;
    string info;
}

```

### Interacting with FOInterfaceV1

**Initialization**
Constructor: Initialize ConsumerFOracle with the address of your deployed FOInterfaceV1 contract.

```solidity
constructor(address _oracle) {
    fOracle = FOInterfaceV1(_oracle);
}
```

**Methods**

getReserve(): Retrieve Proof of Reserve from an Asset address.

```solidity
function getReserve(address _assetId) public {
    DataAsset reserve = fOracle.getReserve(_assetId); 
    // Process reserve values here
    // data.value * data.decimal
}
```

### Best practices 
Create an update Oracle function with a restrict modifier onlyOwner.

```solidity
    function updateOracle(address _oracle) public onlyOwner {   /// @notice Updates the oracle address
        fOracle = FOInterfaceV1(_oracle);
    }
```
