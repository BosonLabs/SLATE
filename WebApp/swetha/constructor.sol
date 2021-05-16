pragma solidity ^0.5.0;

contract Base {
   uint data;
   constructor(uint _data) public {
      data = _data;   
   }
}
contract Derived is Base {
   constructor(uint _info) Base(_info * _info) public {}
}