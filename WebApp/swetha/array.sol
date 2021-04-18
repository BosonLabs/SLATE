pragma solidity ^0.6.8;
contract DynamicArray{
    
int[] private arr; // Declaring state variable  
      
function addData(int num) public    // Function to add data in dynamic array
{
  arr.push(num);
}
      
function getData() public view returns(int[] memory)  // Function to get data of dynamic array
{
  return arr;
}
      
function getLength() public view returns (uint)  // Function to return length dynamic array
{
  return arr.length;
}
  
function getSum() public view returns(int)  // Function to return sum of  elements of dynamic array
{
  uint i;
  int sum = 0;
    
  for(i = 0; i < arr.length; i++)
    sum = sum + arr[i];
  return sum;
}
      
function search(int num) public view returns(bool)  // Function to search an element in dynamic array
{
  uint i;
    
  for(i = 0; i < arr.length; i++)
  {
    if(arr[i] == num)
    {
      return true;
    }
  }
    
  if(i >= arr.length)
    return false;
}
}
