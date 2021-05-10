pragma solidity ^0.4.22;
contract Lucas {
uint[] lucseries;

  function generateLuc(uint n) public {  // n = how many in the series to return

    // set 1st and 2nd entries
    lucseries.push(0);  
    lucseries.push(1);

    // generate subsequent entries
    for (uint i=2; i < n ; i++) {
      lucseries.push(lucseries[i-1] + lucseries[i-2]);
    }
   }
   function getluc() public view returns(uint[]){
       return lucseries;
   }
} 
