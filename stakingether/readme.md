# StakingWithEther

A simple Ethereum smart contract for staking and earning rewards.

## Overview

The SolidityWithEther contract allows users to stake Ether (ETH) and earn rewards based on a specified reward rate and staking duration. Users can unstake their funds, claim rewards, and the owner can withdraw accumulated fees.

## Contract Details

- **Owner:** [Owner's Ethereum Address]
- **Reward Rate:** 10% per minute
- **Staking Duration:** 60 seconds

## Functions

### `stake()`

Allows users to stake Ether.

```solidity
function stake() public payable {
    // ...
}
```

### `unstake()`

Allows users to unstake their funds and claim rewards.

```solidity
function unstake() public {
    // ...
}
```

### `claimreward()`

Allows users to claim their earned rewards.

```solidity
function claimreward() external {
    // ...
}
```

### `calculateReward()`

Calculates the current rewards based on the staking amount, reward rate, and staking duration.

```solidity
function calculateReward() public view returns (uint256) {
    // ...
}
```

### `setRewardRate(uint256 newRewardRate)`

Allows the owner to set a new reward rate.

```solidity
function setRewardRate(uint256 newRewardRate) external onlyOwner {
    // ...
}
```

### `setStakingDuration(uint256 newDuration)`

Allows the owner to set a new staking duration.

```solidity
function setStakingDuration(uint256 newDuration) external onlyOwner {
    // ...
}
```

### `withdrawFees()`

Allows the owner to withdraw accumulated fees.

```solidity
function withdrawFees() external onlyOwner {
    // ...
}
```

## Usage

1. **Stake Ether:**
   Call the `stake` function and send Ether to the contract.

2. **Unstake and Claim Rewards:**
   Call the `unstake` function to retrieve staked funds along with any accumulated rewards.

3. **Claim Rewards:**
   Call the `claimreward` function to claim any earned rewards without unstaking.

4. **Owner Operations:**
   The owner can set a new reward rate, staking duration, and withdraw accumulated fees.

