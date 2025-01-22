// SPDX-License-Identifier: BUSL-1.1
pragma solidity 0.8.28;

/// @title Fact Oracle Interface V1
/// @notice This interface defines the external view functions for accessing data feeds
/// @dev Implemented by contracts that provide oracle data feeds
interface FOInterfaceV1 {
    function getSyncData(uint16 code) external view returns (DataFeed memory datafeed);
    function requestAsyncData(uint16 code, bytes calldata request) external returns (uint128 transactionId);
    function verifyDappData(DataPackage calldata dataPackage) external view returns (bool);
}

/// @title Data Feed Struct
/// @notice This struct represents the data feed with a value and confidence level
/// @dev Used to store oracle data with an associated confidence score

struct DataFeed {   
    int128 value;       /// @dev Integer value of the data feed
    uint64 updatedAt;   /// @dev timestamp in seconts of backend data updated
    uint8 decimal;      /// @dev Number of decimal places for the data value
    uint8 confidence;   /// @dev Confidence level of the data feed
                        /// @dev 0: outlier, 5: acceptable, 95: reliable    
    bytes6 info;        /// @dev Additional information about the data feed                
}

struct DataPackage {   
    uint16 code;          /// @dev Code of the data feed
    uint16 licenseGroup;  /// @dev License group                                           
    int128 value;       /// @dev Integer value of the data feed
    uint64 updatedAt;   /// @dev timestamp in seconts of backend data updated
    uint8 decimal;      /// @dev Number of decimal places for the data value
    uint8 confidence;   /// @dev Confidence level of the data feed                
    bytes6 info;        /// @dev Additional information about the data feed    
    bytes msgHash;        /// @dev Hash of the message
}
