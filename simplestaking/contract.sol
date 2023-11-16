// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    if (a == 0) {
      return 0;
  }
    c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    return a / b;
  }
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}
contract SimpleStaking {
    // Library usage
    using SafeERC20 for IERC20;
    using SafeMath for uint256;
    IERC20 public token;
    mapping(address => uint256) public stakers;
    event tokensStaked(address from, uint256 amount);
    event TokensUnstaked(address to, uint256 amount);

    constructor(IERC20 _token){
       token = _token;
    }

    function stakeTokens(uint256 amount)public{
        require(amount >= 100, "Minimum stake is 100 tokens");
        token.safeTransferFrom(msg.sender, address(this), amount);
        stakers[msg.sender] = stakers[msg.sender].add(amount);
        emit tokensStaked(msg.sender, amount);
    }
    
    function unstake()public{
        require(istokenstake(msg.sender),"Not a staker");
        uint256 amount = stakers[msg.sender];
        token.transfer(msg.sender,amount);
        stakers[msg.sender] = 0;
        emit TokensUnstaked(msg.sender,stakers[msg.sender]);
    }

    function istokenstake(address _owner)public view returns(bool){
        return stakers[_owner]> 0;
    }
    
}
     
