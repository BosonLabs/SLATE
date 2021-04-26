// Solidity program for adopter that adopt a pet by using petid (id from 0 to 15)
//It also returns the address of an adopter
pragma solidity ^0.5.0;

contract Adoption {
    address[16] public adopters;

    // Adopting a pet
    function adopt(uint petId) public returns (uint) {
        require(petId >= 0 && petId <= 15);

        adopters[petId] = msg.sender;

        return petId;
    }

    // Retrieving the adopters
    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }

    // Clear all adopters
    function clear() public {
        for (uint i = 0; i < adopters.length; i++) {
            adopters[i] = address(0);
        }
    }
}