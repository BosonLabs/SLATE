// Conditional Operator
pragma solidity ^0.5.0;

// Creating a contract
contract SolidityTest{

	function sub(uint a, uint b) public view returns(uint){
	uint result = (a > b? a-b : b-a);
	return result;  //a-b
}
}
