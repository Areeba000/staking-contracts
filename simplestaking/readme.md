
# SimpleStaking Contract

This Solidity smart contract, `SimpleStaking`, provides a basic staking mechanism for an ERC-20 token. Users can stake a certain amount of tokens and later unstake them. This README will explain the contract's functionality and usage.

## Overview

The `SimpleStaking` contract allows users to stake a minimum of 100 tokens. Users can stake and unstake tokens as per their requirements. The contract uses the OpenZeppelin SafeERC20 library for secure token transfers.

## Contract Functions

### Constructor

- `constructor(IERC20 _token)`: This is the constructor function that initializes the contract with the address of the ERC-20 token to be staked.


 ![Screenshot 2023-10-26 132044](https://github.com/Areeba000/ERC20/assets/140241495/fb54c10b-50e9-4d44-91d4-c944d240ef31)


 ![Screenshot 2023-10-26 132217](https://github.com/Areeba000/ERC20/assets/140241495/e50d59dc-4725-467a-9d50-db3082164cbe)


### Staking Functions

- `stakeTokens(uint256 amount)`: Allows users to stake a specified amount of tokens. The minimum stake amount is 100 tokens. Tokens are transferred from the user's wallet to the contract, and the staked amount is recorded.

 ![Screenshot 2023-10-26 132403](https://github.com/Areeba000/ERC20/assets/140241495/c06b59c3-dd1b-4670-b795-f8901dc8f919)


- `unstake()`: Allows users to unstake their tokens. The contract checks if the sender is a staker and transfers the staked tokens back to the user.

 ![Screenshot 2023-10-26 132427](https://github.com/Areeba000/ERC20/assets/140241495/171906a1-dd76-4d2b-82a5-fa49de8d9e9a)


- `istokenstake(address _owner)`: Checks if a given address is a staker. It returns `true` if the address has staked tokens and `false` if not.

## Events

The contract emits the following events to keep track of staking and unstaking activities:

- `tokensStaked(address from, uint256 amount)`: Emits when a user stakes tokens. It logs the staker's address and the staked amount.

- `TokensUnstaked(address to, uint256 amount)`: Emits when a user unstakes tokens. It logs the recipient's address and the amount of tokens unstaked.

## Usage

1. Deploy the `SimpleStaking` contract, passing the address of the ERC-20 token you want to use for staking in the constructor.

2. Users can then call the `stakeTokens` function to stake a minimum of 100 tokens.

3. Users can check their staking status using the `istokenstake` function.

4. To unstake, users call the `unstake` function, and the staked tokens will be returned to their wallet.

