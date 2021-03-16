// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0;

/**
 *Submitted for verification at BscScan.com on 2020-09-02
*/

library SafeMath {
  /**
   * @dev Returns the addition of two unsigned integers, reverting on
   * overflow.
   *
   * Counterpart to Solidity's `+` operator.
   *
   * Requirements:
   * - Addition cannot overflow.
   */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a, "SafeMath: addition overflow");

    return c;
  }

  /**
   * @dev Returns the subtraction of two unsigned integers, reverting on
   * overflow (when the result is negative).
   *
   * Counterpart to Solidity's `-` operator.
   *
   * Requirements:
   * - Subtraction cannot overflow.
   */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    return sub(a, b, "SafeMath: subtraction overflow");
  }

  /**
   * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
   * overflow (when the result is negative).
   *
   * Counterpart to Solidity's `-` operator.
   *
   * Requirements:
   * - Subtraction cannot overflow.
   */
  function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
    require(b <= a, errorMessage);
    uint256 c = a - b;

    return c;
  }

  /**
   * @dev Returns the multiplication of two unsigned integers, reverting on
   * overflow.
   *
   * Counterpart to Solidity's `*` operator.
   *
   * Requirements:
   * - Multiplication cannot overflow.
   */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
    if (a == 0) {
      return 0;
    }

    uint256 c = a * b;
    require(c / a == b, "SafeMath: multiplication overflow");

    return c;
  }

  /**
   * @dev Returns the integer division of two unsigned integers. Reverts on
   * division by zero. The result is rounded towards zero.
   *
   * Counterpart to Solidity's `/` operator. Note: this function uses a
   * `revert` opcode (which leaves remaining gas untouched) while Solidity
   * uses an invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   * - The divisor cannot be zero.
   */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    return div(a, b, "SafeMath: division by zero");
  }

  /**
   * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
   * division by zero. The result is rounded towards zero.
   *
   * Counterpart to Solidity's `/` operator. Note: this function uses a
   * `revert` opcode (which leaves remaining gas untouched) while Solidity
   * uses an invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   * - The divisor cannot be zero.
   */
  function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
    // Solidity only automatically asserts when dividing by 0
    require(b > 0, errorMessage);
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold

    return c;
  }

  /**
   * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
   * Reverts when dividing by zero.
   *
   * Counterpart to Solidity's `%` operator. This function uses a `revert`
   * opcode (which leaves remaining gas untouched) while Solidity uses an
   * invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   * - The divisor cannot be zero.
   */
  function mod(uint256 a, uint256 b) internal pure returns (uint256) {
    return mod(a, b, "SafeMath: modulo by zero");
  }

  /**
   * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
   * Reverts with custom message when dividing by zero.
   *
   * Counterpart to Solidity's `%` operator. This function uses a `revert`
   * opcode (which leaves remaining gas untouched) while Solidity uses an
   * invalid opcode to revert (consuming all remaining gas).
   *
   * Requirements:
   * - The divisor cannot be zero.
   */
  function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
    require(b != 0, errorMessage);
    return a % b;
  }
}

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
contract Ownable is Context {
  address private _owner;

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  /**
   * @dev Initializes the contract setting the deployer as the initial owner.
   */
  constructor () internal {
    address msgSender = _msgSender();
    _owner = msgSender;
    emit OwnershipTransferred(address(0), msgSender);
  }

  /**
   * @dev Returns the address of the current owner.
   */
  function owner() public view returns (address) {
    return _owner;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(_owner == _msgSender(), "Ownable: caller is not the owner");
    _;
  }

  /**
   * @dev Leaves the contract without owner. It will not be possible to call
   * `onlyOwner` functions anymore. Can only be called by the current owner.
   *
   * NOTE: Renouncing ownership will leave the contract without an owner,
   * thereby removing any functionality that is only available to the owner.
   */
  function renounceOwnership() public onlyOwner {
    emit OwnershipTransferred(_owner, address(0));
    _owner = address(0);
  }

  /**
   * @dev Transfers ownership of the contract to a new account (`newOwner`).
   * Can only be called by the current owner.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    _transferOwnership(newOwner);
  }

  /**
   * @dev Transfers ownership of the contract to a new account (`newOwner`).
   */
  function _transferOwnership(address newOwner) internal {
    require(newOwner != address(0), "Ownable: new owner is the zero address");
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
  }
}

contract SLATEToken is Context, IBEP20, Ownable {
  using SafeMath for uint256;

  mapping (address => uint256) private _balances;

  mapping (address => mapping (address => uint256)) private _allowances;

  uint256 private _totalSupply;
  uint8 public _decimals;
  string public _symbol;
  string public _name;

  constructor() public {
    _name = "SLATE Token";
    _symbol = "SLATE";
    _decimals = 9;
    _totalSupply = 10000000000000000000;
    _balances[msg.sender] = _totalSupply;

    emit Transfer(address(0), msg.sender, _totalSupply);
  }

  /**
   * @dev Returns the bep token owner.
   */
  function getOwner() external view returns (address) {
    return owner();
  }

  /**
   * @dev Returns the token decimals.
   */
  function decimals() external view returns (uint8);

  /**
   * @dev Returns the token symbol.
   */
  function symbol() external view returns (string memory);

  /**
  * @dev Returns the token name.
  */
  function name() external view returns (string memory);

  /**
   * @dev Returns the bep token owner.
   */
  function getOwner() external view returns (address);

  /**
   * @dev Returns the amount of tokens owned by `account`.
   */
  function balanceOf(address account) external view returns (uint256);

  /**
   * @dev Moves `amount` tokens from the caller's account to `recipient`.
   *
   * Returns a boolean value indicating whether the operation succeeded.
   *
   * Emits a {Transfer} event.
   */
  function transfer(address recipient, uint256 amount) external returns (bool);

  /**
   * @dev Returns the remaining number of tokens that `spender` will be
   * allowed to spend on behalf of `owner` through {transferFrom}. This is
   * zero by default.
   *
   * This value changes when {approve} or {transferFrom} are called.
   */
  function allowance(address _owner, address spender) external view returns (uint256);

  /**
   * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
   *
   * Returns a boolean value indicating whether the operation succeeded.
   *
   * IMPORTANT: Beware that changing an allowance with this method brings the risk
   * that someone may use both the old and the new allowance by unfortunate
   * transaction ordering. One possible solution to mitigate this race
   * condition is to first reduce the spender's allowance to 0 and set the
   * desired value afterwards:
   * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
   *
   * Emits an {Approval} event.
   */
  function approve(address spender, uint256 amount) external returns (bool);

  /**
   * @dev Moves `amount` tokens from `sender` to `recipient` using the
   * allowance mechanism. `amount` is then deducted from the caller's
   * allowance.
   *
   * Returns a boolean value indicating whether the operation succeeded.
   *
   * Emits a {Transfer} event.
   */
  function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

  /**
   * @dev Emitted when `value` tokens are moved from one account (`from`) to
   * another (`to`).
   *
   * Note that `value` may be zero.
   */
  event Transfer(address indexed from, address indexed to, uint256 value);

  /**
   * @dev Emitted when the allowance of a `spender` for an `owner` is set by
   * a call to {approve}. `value` is the new allowance.
   */
  event Approval(address indexed owner, address indexed spender, uint256 value);
}
/*created by:
Prabhakaran (@Prabhakaran1998)
Martina Gracy(@Martinagracy28)
Role:solidity Developer-boson labs
date:23-FEB-2020
reviewed by:hemadri -project director-Boson Labs 
*/

contract SLATE is Owned {
    using SafeMath for uint256;
    
    bool public isSLATEOpen;
    
    //@dev ERC20 token address and decimals
    address public tokenAddress;
    address public BUSDAddress;
    uint256 public tokenDecimals = 9;
    
    //@dev amount of tokens per BUSD i.e. 3000 tokens per 1 BUSD
    uint256 public tokenRatePerBNB = 300000;
    //@dev decimal for tokenRatePerBNB,
    //2 means if you want 100 tokens per BNB then set the rate as 100 + number of rateDecimals i.e => 10000
    uint256 public rateDecimals = 2;
    
    //@dev max and min token buy limit per account
    uint256 public minEthLimit = 1 finney;
    uint256 public maxEthLimit = 10 ether;
    
    mapping(address => uint256) public usersInvestments;
    
    constructor() public {
        owner = msg.sender;
    }
    /*
     start the SLATE for usersInvestments 
     */
     
    function startSLATE() external onlyOwner{
        require(!isSLATEOpen, "SLATE is open");
        
        isSLATEOpen = true;
    }
    
    /*
    close the SLATE contract after usersInvestments to be ended
    */
    
    function closePrsale() external onlyOwner{
        require(isSLATEOpen, "SLATE is not open yet.");
        
        isSLATEOpen = false;
    }
    
    /*
    set the token contract address for transfering the tokens to the usersInvestments
    */
    
    function setTokenAddress(address token) external onlyOwner {
        require(tokenAddress == address(0), "Token address is already set.");
        require(token != address(0), "Token address zero not allowed.");
        
        tokenAddress = token;
    }
    /*
    set the BUSD contract address for transfering the BUSD from the Investors
    */
     function setBUSDAddress(address BUSD) external onlyOwner {
        require(BUSDAddress == address(0), "Token address is already set.");
        require(BUSD != address(0), "Token address zero not allowed.");
        
        BUSDAddress = BUSD;
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
        tokenRatePerBNB = rate;
    }
    
    function setRateDecimals(uint256 decimals) external onlyOwner {
        rateDecimals = decimals;
    }
    /*
    This function is used for deducting the BUSD from user
    And that amount is transfered to the owner of the SLATE contract.
    */
     function swapByBUSD(uint256 amount) internal returns(bool){
        require(isSLATEOpen, "SLATE is not open.");
       
        
       IBEP20(BUSDAddress).transferFrom(msg.sender,owner, amount);
       return true;
        
    }
    /*
    This function is used for investing BUSD token by the user
    And it will send the equivalent amount of tokens to that user.
    */ 
   
    function buySlate(uint256 amount) external payable{
         require(isSLATEOpen, "SLATE is not open.");
       
        //@dev calculate the amount of tokens to transfer for the given BNB
        uint256 tokenAmount = getTokensPerBNB(amount);
        
        swapByBUSD(amount);
        require(IToken(tokenAddress).transfer(msg.sender, tokenAmount), "Insufficient balance of SLATE contract!");
        
        usersInvestments[msg.sender] = usersInvestments[msg.sender].add(amount);
    }
    
    /*
    It will returns the Amount of token for BUSD token invested by user.
    */
    function getTokensPerBNB(uint256 amount) internal view returns(uint256) {
        return amount.mul(tokenRatePerBNB).div(
            10**(uint256(18).sub(tokenDecimals).add(rateDecimals))
            );
    }
    
    /*
    After SLATE is closed ,the unsold tokens can be burned.
    */
    
    function burnUnsoldTokens() external onlyOwner {
        require(!isSLATEOpen, "You cannot burn tokens untitl the SLATE is closed.");
        
        IToken(tokenAddress).burnTokens(IToken(tokenAddress).balanceOf(address(this)));   
    }
    
    /*
    After SLATE is closed the owner can transfer the unsold to the 
    token owner address by getUnsoldTokens.
    */
    
    function getUnsoldTokens() external onlyOwner {
        require(!isSLATEOpen, "You cannot get tokens until the SLATE is closed.");
        
        IToken(tokenAddress).transfer(owner, IToken(tokenAddress).balanceOf(address(this)) );
    }
}