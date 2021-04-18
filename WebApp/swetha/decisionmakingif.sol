//program for if-else
pragma solidity ^0.5.0;

contract SolidityTest {
   uint storedData; 
   constructor() public{
      storedData = 10;   
   }
   function getResult() public view returns(uint){
      uint a = 3; 
      uint b = 3;
      if(storedData==10){  //if statement
      uint result = a + b;
      return result;
      }
      else{               //else statement
      uint sub=a-b;
      return sub;
      }
   }
}