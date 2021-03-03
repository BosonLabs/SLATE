// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 *
*/

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

  function ceil(uint a, uint m) internal pure returns (uint r) {
    return (a + m - 1) / m * m;
  }
}

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address payable public owner;

    event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    /*
    Transfer the ownership from owner to new owner
    */
    function transferOwnership(address payable _newOwner) public onlyOwner {
        owner = _newOwner;
        emit OwnershipTransferred(msg.sender, _newOwner);
    }
}


// ----------------------------------------------------------------------------
// BEP Token Standard #20 Interface
// ----------------------------------------------------------------------------
interface IToken {
    function transfer(address to, uint256 tokens) external returns (bool success);
    function burnTokens(uint256 _amount) external;
    function balanceOf(address tokenOwner) external view returns (uint256 balance);
}
/*created by:
Prabhakaran (@Prabhakaran1998)
Martina Gracy(@Martinagracy28)
Role:solidity Developer-boson labs
date:23-FEB-2020
reviewed by:hemadri -project director-Boson Labs */

contract Slate is Owned {
    using SafeMath for uint256;
    
    bool public isSlateOpen;
    
    //@dev ERC20 token address and decimals
    address public tokenAddress;
    uint256 public tokenDecimals = 9;
    
    //@dev amount of tokens per ether 1 indicates 1 token per eth
    uint256 public tokenRatePerEth = 3000000;
    //@dev decimal for tokenRatePerEth,
    //2 means if you want 100 tokens per eth then set the rate as 100 + number of rateDecimals i.e => 10000
    uint256 public rateDecimals = 2;
    
    //@dev max and min token buy limit per account
    uint256 public minEthLimit = 10 finney;
    uint256 public maxEthLimit = 10 ether;
    
    mapping(address => uint256) public usersInvestments;
    
    constructor() public {
        owner = msg.sender;
    }
    /*
     start the slate for usersInvestments 
     */
     
    function startSlate() external onlyOwner{
        require(!isSlateOpen, "Slate is open");
        
        isSlateOpen = true;
    }
    
    /*
    close the slate contract after usersInvestments to be ended
    */
    
    function closeSlate() external onlyOwner{
        require(isSlateOpen, "Slate is not open yet.");
        
        isSlateOpen = false;
    }
    
    /*
    set the token contract address for transfering the tokens to the usersInvestments
    */
    
    function setTokenAddress(address token) external onlyOwner {
        require(tokenAddress == address(0), "Token address is already set.");
        require(token != address(0), "Token address zero not allowed.");
        
        tokenAddress = token;
    }
    
    function setTokenDecimals(uint256 decimals) external onlyOwner {
       tokenDecimals = decimals;
    }
    
    function setMinEthLimit(uint256 amount) external onlyOwner {
        minEthLimit = amount;    
    }
    
    function setMaxEthLimit(uint256 amount) external onlyOwner {
        maxEthLimit = amount;    
    }
    
    function setTokenRatePerEth(uint256 rate) external onlyOwner {
        tokenRatePerEth = rate;
    }
    
    function setRateDecimals(uint256 decimals) external onlyOwner {
        rateDecimals = decimals;
    }
    /*
    when calling the receive function user must 
    send the amount as ether or BNB or finney to
    the token contract.
    */
    
    function receive() external payable{
        require(isSlateOpen, "Slate is not open.");
       require(
                usersInvestments[msg.sender].add(msg.value) <= maxEthLimit
                && usersInvestments[msg.sender].add(msg.value) >= minEthLimit,
                "Amount should be less than 10 for ether and greater that 10 for finney"
            );
            
        
        //@dev calculate the amount of tokens to transfer for the given eth
        uint256 tokenAmount = getTokensPerEth(msg.value);
        
        require(IToken(tokenAddress).transfer(msg.sender, tokenAmount), "Insufficient balance of slate contract!");
        
        usersInvestments[msg.sender] = usersInvestments[msg.sender].add(msg.value);
        
        //@dev send received funds to the owner
        owner.transfer(msg.value);
    }
    
    function getTokensPerEth(uint256 amount) public view returns(uint256) {
        return amount.mul(tokenRatePerEth).div(
            10**(uint256(18).sub(tokenDecimals).add(rateDecimals))
            );
    }
    
    /*
    After slate is closed ,the unsold tokens can be burned.
    */
    
    function burnUnsoldTokens() external onlyOwner {
        require(!isSlateOpen, "You cannot burn tokens untitl the slate is closed.");
        
        IToken(tokenAddress).burnTokens(IToken(tokenAddress).balanceOf(address(this)));   
    }
    
    /*
    After slate is closed the owner can transfer the unsold to the 
    token owner address by getUnsoldTokens.
    */
    
    function getUnsoldTokens() external onlyOwner {
        require(!isSlateOpen, "You cannot get tokens until the slate is closed.");
        
        IToken(tokenAddress).transfer(owner, IToken(tokenAddress).balanceOf(address(this)) );
    }
}