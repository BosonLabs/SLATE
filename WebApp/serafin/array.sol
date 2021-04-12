// simple solidity program for array
pragma solidity ^0.6.8;
contract DynamicArray{

// decla
ration for DynamicArray    
int[] private arr; 

// function to addData in DynamicArray     
function addData(int num) public   
{
  arr.push(num);
}

// function to getdata in the DynamicArray     
function getData() public view returns(int[] memory)  
{
  return arr; 
}

// function to getlength in the DynamicArray      
function getLength() public view returns (uint)  
{
  return arr.length;
}

// function to getSum in the DynamicArray  
function getSum() public view returns(int)  
{
  uint i;
  int sum = 0;
    
  for(i = 0; i < arr.length; i++)
    sum = sum + arr[i];
  return sum;
}

// function to search an element in the DynamicArray      
function search(int num) public view returns(bool)  
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