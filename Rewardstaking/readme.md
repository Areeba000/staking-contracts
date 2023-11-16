# MyStaking Smart Contract

## Overview

MyStaking is a Solidity smart contract designed for token staking with rewards. Users can stake a specified ERC-20 token and receive rewards based on a configurable reward rate over a fixed staking duration.

## Features

- **Staking:** Users can stake a certain amount of the ERC-20 token.
- **Rewards:** Users earn rewards based on a predefined reward rate.
- **Unstaking:** Users can unstake their tokens after the staking duration is reached, receiving both their staked amount and rewards.

## Reward Calculation

Rewards are calculated using the formula:

```plaintext
rewardAmount = stakedAmount * rewardRate / 100
```

## Usage

### Deploying the Contract

1. Deploy the ERC-20 token contract.
2. Deploy the MyStaking contract, specifying the ERC-20 token address and the desired reward rate.

### Interacting with the Contract

1. **Staking:**

   - Users stake a certain amount of the ERC-20 token.

2. **Unstaking:**

   - Users can unstake their tokens after the staking duration is reached, receiving both their staked amount and rewards.

3. **Checking Staking Status:**

   - Users can check their staking status to see if they are currently staking.

## Configuration

### Reward Rate

The reward rate is a percentage that determines the rewards earned by stakers. It can be configured during the contract deployment.

### Staking Duration

The staking duration is the period users must wait before they can unstake their tokens and receive rewards. It can be configured by the contract owner.


