// In the below example, a contract is created to demonstrate the ‘storage’ keyword.

//When we retrieve the value of the array numbers in this code,  the output of the array is [0,2] and not [1,2]. 
pragma solidity ^0.4.17;
  
contract stroage
{
  // Initialising array numbers
  uint[] public numbers;
  
  // Function to insert values in the array numbers
  function storagenumbers() public 
  {
    numbers.push(1);
    numbers.push(2);
  
    //Creating a new instance
    uint[] storage myArray = numbers;
      
    // Adding value to the first index of the new Instance
    myArray[0] = 0;
  }
}

//In the below example, a contract is created to demonstrate the keyword ‘memory’.

//the output of the array is [1,2]. In this case, changing the value of myArray does not affect the value in the array numbers

contract memory
{  
  // Initialising array numbers
  int[] public numbers;
    
  // Function to insert
  // values in the array
  // numbers
  function memoryNumbers() public 
  {
    numbers.push(1);
    numbers.push(2);
      
    //creating a new instance
    int[] memory myArray = numbers;
      
    // Adding value to the first
    // index of the arrat myArray
    myArray[0] = 0;
  }  
}