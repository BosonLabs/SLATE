// Solidity program to demonstrate
// how to use 'enumerator'
pragma solidity ^0.5.0;

// Creating a contract
contract Types {

	// Creating an enumerator
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

	// Declaring variables of
	// type enumerator
	week_days week;	
	
	week_days choice;

	// Setting a default value
	week_days constant default_value
	= week_days.Sunday;
	
	// Defining a function to
	// set value of choice
	function set_value() public {
	choice = week_days.Thursday;
	}