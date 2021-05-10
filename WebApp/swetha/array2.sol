// accessing elements of an array
pragma solidity ^0.5.0;

contract Types {

	uint[6] data=[3,4];	
	
	function array_example(	) public view returns (uint[6] memory){
		return data;
     }
	
    function array_element() public view returns (uint){
		uint x = data[0];
		return x;
        
    }
    }
