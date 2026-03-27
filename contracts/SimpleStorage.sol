// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract SimpleStorage {
    
    uint256 private storedData;
    address public owner;
    uint256 public lastUpdated;
    
    struct DataHistory {
        uint256 value;
        uint256 timestamp;
        address updater;
    }
    
    DataHistory[] public history;
    
    event DataStored(uint256 newValue, uint256 timestamp);
    event OwnerChanged(address newOwner);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    
    constructor() {
        owner = msg.sender;
        storedData = 0;
        lastUpdated = block.timestamp;
    }
    
    function set(uint256 _value) external onlyOwner {
        storedData = _value;
        lastUpdated = block.timestamp;
        
        history.push(DataHistory({
            value: _value,
            timestamp: block.timestamp,
            updater: msg.sender
        }));
        
        emit DataStored(_value, block.timestamp);
    }
    
    function get() external view returns (uint256) {
        return storedData;
    }
    
    function getHistory() external view returns (DataHistory[] memory) {
        return history;
    }
    
    function getHistoryLength() external view returns (uint256) {
        return history.length;
    }
    
    function changeOwner(address newOwner) external onlyOwner {
        require(newOwner != address(0), "Invalid address");
        owner = newOwner;
        
        emit OwnerChanged(newOwner);
    }
    
    function deleteHistory() external onlyOwner {
        delete history;
    }
}
