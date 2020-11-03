pragma solidity 0.5.12;

contract Visibility{
    // State variables

    //Struct ie list of objects
    struct Person{
        string name;
        uint age;
        uint height;
        bool senior;
        }

    // initialise your mapping which is the users address to Person
    mapping(address => Person) public people;       // mapping to a Person; can change public to private

    /*
    In this example you breaking up logic into respective functions
    1) Create the Person
    2) Insert the person
    */


     //Create the Person
    function fnCreatePerson(string memory name, uint age, uint height) public {
         Person memory newPerson;
         newPerson.name = name;
         newPerson.age = age;
         newPerson.height = height;
         if(age > 65) {
             newPerson.senior = true;
            }
         else {
             newPerson.senior = false;
            }
        fnInsertPerson(newPerson);      //Call the function to Insert the person
        }

    //Insert the person
    function fnInsertPerson(Person memory newPerson) private {      //private as it is internal to the contract
        address creator = msg.sender;                               // msg.sender - provides the eth address of the caller of the function
                                                                    // Now let creator point to newPerson
         people[creator] = newPerson;                               // NNB reference the Person created by their address this is the mapping. Dont need to push
    }


    function fnGetPerson() public view returns (string memory name, uint age, uint height, bool senior) {
        address creator = msg.sender;
        return (people[creator].name,  people[creator].age, people[creator].height, people[creator].senior);        // return 3 elements of the Person
    }


    
