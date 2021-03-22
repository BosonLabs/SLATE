//sample programs
pragma solidity >=0.4.0 <0.6.0;
contract SimpleStorage {
   uint storedDataa;
   function set(uint x) public {
      storedDataa = x;
   }
   function get() public view returns (uint) {
      return storedDataa;
   }
}