// Solidity program for understanding Decision Making
pragma solidity ^0.5.0;

contract SolidityTest {
   uint storedData; // State variable
   constructor() public {
      storedData = 10;   
   }
   function getResult() public view returns(string memory) {
      uint a = 1; 
      uint b = 2;
      uint c = 3;
      uint result
      
      if( a > b && a > c) {   // if else statement
         result = a;
      } else if( b > a && b > c ){
         result = b;
      } else {
         result = c;
      }       
      return integerToString(result); 
   }
   function integerToString(uint _i) internal pure 
      returns (string memory) {
      
      if (_i == 0) {
         return "0";
      }
      uint j = _i;
      uint len;
      
      while (j != 0) {
         len++;
         j /= 10;
      }
      bytes memory bstr = new bytes(len);
      uint k = len - 1;
      
      while (_i != 0) {
         bstr[k--] = byte(uint8(48 + _i % 10));
         _i /= 10;
      }
      return string(bstr);//access local variable
   }
}
