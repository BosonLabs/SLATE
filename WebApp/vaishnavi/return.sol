// Solidity program to demonstrate return statements
pragma solidity ^0.5.0;
  
contract Test {
  
   // Defining a public view function to demonstrate return statement
   function return_example() public view returns(uint, uint, uint, string memory){
      uint num1 = 10; 
      uint num2 = 16;
      uint sum = num1 + num2;
      uint prod = num1 * num2;
      uint diff = num2 - num1;
      string memory msg = "Multiple return values";
      return (sum, prod, diff, msg); 
   }
}