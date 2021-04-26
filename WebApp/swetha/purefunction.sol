pragma solidity ^0.5.0;

contract Test {
   function getResult() public pure returns(uint product, uint sum) //pure function
    {
      uint a = 1; 
      uint b = 2;
      product = a * b;
      sum = a + b; 
   }
}