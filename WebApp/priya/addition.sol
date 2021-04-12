contract SolidityTest {
   constructor() public{
   }
   function getResult() public view returns(uint){
      uint a = 1; 
      uint b = 2;
      uint result = a + b; //arithmetic operation
      return result; 
   }
}
