//simple program for enum
pragma solidity ^0.5.0;

contract test{
    enum SelectColour{ RED, BLUE, BLACK }
    SelectColour choice;
    SelectColour constant defaultChoice = SelectColour.BLUE;

    function setBlue() public {
        choice = SelectColour.BLUE;
    }
    function getChoice() public view returns (SelectColour) {
        return choice;
    }
    function getdefaultChoice() public pure returns (uint) {
        return uint(defaultChoice);
    }
}