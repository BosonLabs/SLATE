pragma solidity ^0.5.0; 
   
contract Types {  
  
    // Creating an enumeration week
    enum week_days 
    { 
      Monday, 
      Tuesday, 
      Wednesday, 
      Thursday, 
      Friday, 
      Saturday, 
      Sunday 
     }  
  
    // Declaring variables of type enumerator
    week_days week;    
      
    week_days choice;
  
    // Setting a default value
    week_days constant default_value 
      = week_days.Sunday;
      
    function set_value() public {
      choice = week_days.Thursday;
    }
  
    // Defining a function to return value of choice 
    function get_choice() public view returns (week_days) {
      return choice;
    }
        
    // Defining function to return default value
    function getdefaultvalue() public pure returns(week_days) {  
        return default_value;  
    }  
}