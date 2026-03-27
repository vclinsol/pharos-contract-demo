# Pharos Contract Demo

## Overview
A simple storage contract designed for learning and testing on Pharos testnet. This contract demonstrates basic Solidity concepts including state variables, events, and access control.

## Features
- Store and retrieve uint256 values
- Track data history with timestamps
- Owner-based access control
- Event logging for all changes
- Owner transfer functionality

## Contract Details
- **Network**: Pharos Testnet
- **Solidity Version**: 0.8.20
- **License**: MIT
- **Access Control**: Owner only

## Deployment
1. Compile using Remix IDE
2. Deploy to Pharos Testnet
3. Verify on Pharos Explorer
4. Test set/get functions

## Usage Examples

### Store Data
```javascript
await contract.set(42);
```

### Retrieve Data
```javascript
const value = await contract.get();
```

### Get History
```javascript
const history = await contract.getHistory();
```

### Change Owner
```javascript
await contract.changeOwner(newOwnerAddress);
```

## Events
- `DataStored(uint256 newValue, uint256 timestamp)`
- `OwnerChanged(address newOwner)`

## Learning Objectives
- Understanding state variables
- Working with structs and arrays
- Implementing access modifiers
- Event emission and tracking
- Contract ownership patterns

## Security Notes
- Only owner can modify data
- Owner transfer is irreversible
- History cannot be modified (only deleted)

## License
MIT License - See LICENSE file for details
