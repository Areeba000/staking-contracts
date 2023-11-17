// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "hardhat/console.sol";
contract soliditywithether{
    address public owner;
    uint256 public rewardRate = 10;
    uint256 public stakingDuration = 60;
     struct data{
        uint256 stakedAmounts;
        uint256 StakeTimes;
        uint256 claimedReward;
    }
    
    mapping(address => data) public stakers;
    constructor(){
        owner=msg.sender;
    }
    modifier onlyOwner{
        require(owner==msg.sender,"you are not owner");
        _;
    }
    function stake()public payable{
       require(msg.value > 0, "You must stake a non-zero amount");
       stakers[msg.sender]. stakedAmounts += msg.value;
       stakers[msg.sender].StakeTimes = block.timestamp;
      
    }
    function unstake()public {
        require( stakers[msg.sender]. stakedAmounts > 0, "No funds staked");
        console.log(calculateReward());
        payable(msg.sender).transfer( stakers[msg.sender]. stakedAmounts+calculateReward());
        stakers[msg.sender]. stakedAmounts=0;
    }
     function claimreward()external{
        uint256 reward = calculateReward();
        require(reward > 0, "No rewards to claim");
        uint256 netReward = reward-(stakers[msg.sender].claimedReward);
        payable(msg.sender).transfer(netReward);
        stakers[msg.sender].claimedReward = reward;
        stakers[msg.sender].StakeTimes = block.timestamp;

    }
    
     function calculateReward() public view returns (uint256) {
        uint256 stakedAmount =stakers[msg.sender]. stakedAmounts;
        uint256 lastTimestamp =stakers[msg.sender].StakeTimes;

        if (stakedAmount == 0 || lastTimestamp == 0) {
            return 0;
        }
        console.log(stakedAmount);
        console.log(rewardRate);
        console.log( block.timestamp - lastTimestamp);
        uint256 timeElapsed = block.timestamp - lastTimestamp;
         if (timeElapsed > stakingDuration) {
            timeElapsed = stakingDuration;
        }
        uint256 reward = (stakedAmount * rewardRate * timeElapsed) / 100 / 60; // reward per minute
        uint256 netReward = reward-(stakers[msg.sender].claimedReward);

        return netReward;
    }
    function setRewardRate(uint256 newRewardRate) external onlyOwner {
        rewardRate = newRewardRate;
    }

    function setStakingDuration(uint256 newDuration) external onlyOwner {
        stakingDuration = newDuration;
    }
    function withdrawFees() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
     receive() external payable { }


}
