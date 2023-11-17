# MyStaking Smart Contract

## Overview

This Solidity smart contract implements a simple staking system where users can stake a specific ERC-20 token and earn rewards over time.

## Features

- Users can stake their tokens.
- Users can unstake their tokens and claim rewards.
- The contract owner can adjust the reward rate and staking duration.

## Prerequisites

- An Ethereum development environment.
- An ERC-20 token for staking.

## Getting Started

1. Deploy the contract to an Ethereum-compatible blockchain.
2. Ensure that the ERC-20 token is available and approved for transfer.
3. Users can stake tokens using the `stake` function.
4. Users can unstake and claim rewards using the `unstake` and `claimreward` functions.
5. The contract owner can adjust the reward rate and staking duration using the `setRewardRate` and `setStakingDuration` functions.

## Contract Details

- Contract address: [Deployed Contract Address]
- ERC-20 Token Address: [Token Address]

## Functions

### `stake(uint256 amount) external`

Allows users to stake a certain amount of tokens.

### `unstake() external`

Allows users to unstake their tokens and claim rewards.

### `claimreward() external`

Allows users to claim their earned rewards.

### `calculateReward() public view returns (uint256)`

Calculates the accrued rewards for a user based on their staked amount and duration.

### `setRewardRate(uint256 newRewardRate) external onlyOwner`

Allows the contract owner to set a new reward rate.

### `setStakingDuration(uint256 newDuration) external onlyOwner`

Allows the contract owner to set a new staking duration.

### `istokenstake(address _owner) public view returns(bool)`

Check if a specific address has staked tokens.

