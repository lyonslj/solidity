pragma solidity 0.5.12;

contract ErrorHandling{

    /*
    In this example you breaking up logic into respective functions
    1) Create the Person
    2) Insert the person
    3) Get the person
    4) Delete the contract - done by error handling using contract creator
    5) Add array to list all addresses that have created contracts / people
        mapping currenlty only gets us to a person if we have address
        Add address array called creators
        then create a getter (getCreator) that can access the array
    */

    //Struct ie list of objects
    struct Person{
        string name;
        uint age;
        uint height;
        bool senior;
        }

    // constructor is run when the contract is created
    //we want to know who the owner of the contract is. This is only run once and at creation
    address public owner;
    constructor() public {
        owner = msg.sender;
        }

    // initialise your mapping which is the users address to Person
    mapping(address => Person) private people;       // mapping to a Person; can change public to private
    address[] private creators;                      // only accessible by owner




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
        creators.push(msg.sender);      //Add to array
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

    //Only want the owner to be able to delete the contract
    //This is done with error handling ie require
    function fnDeleteContract(address creator) public {
        require(msg.sender == owner, "You are not contract owner and cannot delete");           // if owner = msg.sender then delet contract else throw error
        delete people[creator];
    }

    function getCreator(uint index) public view returns(address){
       require(msg.sender == owner, "Caller needs to be owner");                // restrict to owner
       return creators[index];
   }

}
