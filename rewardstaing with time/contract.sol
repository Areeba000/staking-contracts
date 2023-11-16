// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";


contract MyStaking is Ownable{
    using SafeERC20 for IERC20;
    using SafeMath for uint256;
    IERC20 public token;
    
    uint256  STAKING_DURATION = 60;
    uint256 public rewardRatePerSecond;
    
    struct data{
        uint256 stakeAmount; 
        uint256 stakingTime;
    }
    mapping(address => data) public stakers;
    
    event Staked(address indexed staker, uint256 amount, uint256 stakingTimestamp);
    event Unstaked(address indexed staker, uint256 amount);
    constructor(IERC20 _token, uint256 _rewardRatePerMinute) {
        token = _token;
        rewardRatePerSecond = (_rewardRatePerMinute * 10**18) /60 ;
    }

    function stake(uint256 amount)public {
       require(amount > 0, "Amount must be greater than 0");
       token.safeTransferFrom(msg.sender, address(this), amount );
       stakers[msg.sender].stakeAmount = stakers[msg.sender].stakeAmount.add(amount);
       stakers[msg.sender].stakingTime = block.timestamp;

       emit Staked(msg.sender, amount, block.timestamp);
    }

    function unstake() external {
        require(stakers[msg.sender].stakeAmount > 0, "No balance to unstake");
        require(isTokenStaked(msg.sender),"Not a staker");
        uint256 stakedTime = block.timestamp - stakers[msg.sender].stakingTime;
        console.log(stakedTime);
        uint256 rewardAmount =stakers[msg.sender].stakeAmount.mul(stakedTime).mul(rewardRatePerSecond).div(100);
        console.log(rewardAmount);
        token.transfer(msg.sender, stakers[msg.sender].stakeAmount + rewardAmount/10**18);
        stakers[msg.sender] = data(0, 0);
       
        emit Unstaked(msg.sender, stakers[msg.sender].stakeAmount);
    }

     function isTokenStaked(address _user) public view returns (bool) {
        return stakers[_user].stakeAmount > 0;
    }

    function setRewardRatePerMinute(uint256 _rewardRatePerMinute) external onlyOwner {
        rewardRatePerSecond = _rewardRatePerMinute / 60 ; // Convert to per second rate
    }

}

