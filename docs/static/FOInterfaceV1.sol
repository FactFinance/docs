// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

/// @title Fact Oracle Interface V1
/// @notice This interface defines the external view functions for accessing data feeds
/// @dev Implemented by contracts that provide oracle data feeds
interface FOInterfaceV1 {
    function getFeed(uint8 _feedId) external  returns (DataFeed memory _datafeed);
    function getReserve(address _assetId) external returns (DataAsset memory _dataAsset);
    function subcribeOracle(address _contractAddress,  string calldata _projectName) external;
}

/// @title Data Feed Struct
/// @notice This struct represents the data feed with a value and confidence level
/// @dev Used to store oracle data with an associated confidence score

struct DataFeed {   
    int256 value;       /// @dev Integer value of the data feed
    uint256 updatedAt;   /// @dev timestamp of backend data update
    uint8 decimal;       /// @dev Number of decimal places for the data value
    uint8 confidence;   /// @dev Confidence level of the data feed
                        /// @dev 1: outlier, 2: acceptable, 3: reliable
}

struct DataAsset {
    uint256 value;      /// @dev Integer value of the asset
    uint256 updatedAt;  /// @dev Timestamp of backend data update
    uint8 decimal;      /// @dev Number of decimal places for the data value
    string info;        /// @dev Additional information about the asset
}
