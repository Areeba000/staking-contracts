// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyStaking is Ownable{
    using SafeERC20 for IERC20;
    using SafeMath for uint256;
    IERC20 public token;
    uint256 public rewardRate = 10;
    uint256 public stakingDuration = 60;
    struct data{
        uint256 stakedAmounts;
        uint256 StakeTimes;
        uint256 claimedReward;
    }
    mapping(address => data) public stakers;
    
    constructor(IERC20 _token) {
        token = _token;
    
    }
    function stake(uint256 amount) external  {
       require(amount > 0, "You must stake a non-zero amount");
      token.safeTransferFrom(msg.sender, address(this), amount );
       stakers[msg.sender].stakedAmounts = stakers[msg.sender].stakedAmounts.add(amount);
       stakers[msg.sender].StakeTimes = block.timestamp;
  
    }

    function unstake() external {
        require(stakers[msg.sender].stakedAmounts > 0, "No funds staked");
        uint256 totalAmount = stakers[msg.sender].stakedAmounts + calculateReward();
        token.transfer(msg.sender,totalAmount);
        
        stakers[msg.sender].stakedAmounts = 0;
        stakers[msg.sender].StakeTimes = 0;
        stakers[msg.sender].claimedReward = 0;
    }

    function claimreward()external{
        uint256 reward = calculateReward();
        require(reward > 0, "No rewards to claim");
        uint256 netReward = reward.sub(stakers[msg.sender].claimedReward);
        token.transfer(msg.sender,netReward);
        stakers[msg.sender].claimedReward = reward;
        stakers[msg.sender].StakeTimes = block.timestamp;

    }

    function calculateReward() public view returns (uint256) {
        uint256 stakedAmount =  stakers[msg.sender].stakedAmounts;
        uint256 lastTimestamp = stakers[msg.sender].StakeTimes;
        if (stakedAmount == 0 || lastTimestamp == 0) {
            return 0;
        }
        uint256 timeElapsed = block.timestamp - lastTimestamp;
         if (timeElapsed > stakingDuration) {
            timeElapsed = stakingDuration;
        }
        
        uint256 reward = (stakedAmount * rewardRate * timeElapsed) / 100 / 60; // reward per minute
        
         uint256 netReward = reward.sub(stakers[msg.sender].claimedReward);

        return netReward;
    }
    // Allow the owner to change the reward rate
    function setRewardRate(uint256 newRewardRate) external onlyOwner {
        require(newRewardRate >= 0, "Reward rate must be non-negative");
        rewardRate = newRewardRate;
    }

    // Allow the owner to change the staking duration
    function setStakingDuration(uint256 newDuration) external onlyOwner {
        require(newDuration > 0, "Staking duration must be greater than 0");
        stakingDuration = newDuration;
    }
     function istokenstake(address _owner)public view returns(bool){
       return stakers[_owner].stakedAmounts > 0;
    }

    }
