pragma solidity 0.5.12;

contract ErrorHandlingInvariants{

    /*
    The use of the modifier means code used extensively is declared upfront ie onlyOwner
    Then gets references in function in their topline

    */

    //Struct ie list of objects
    struct Person{
        string name;
        uint age;
        uint height;
        bool senior;
        }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _; //Continue execution
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

        assert(
            keccak256(
                abi.encodePacked(
                    people[msg.sender].name,
                    people[msg.sender].age,
                    people[msg.sender].height,
                    people[msg.sender].senior)
                    )
            ==
            keccak256(
                abi.encodePacked(
                    newPerson.name,
                    newPerson.age,
                    newPerson.height,
                    newPerson.senior))
                    );


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
    function fnDeleteContract(address creator) public onlyOwner {
        delete people[creator];
        assert(people[creator].age == 0);           //after deleting age = 0
    }

    function getCreator(uint index) public view onlyOwner returns(address){
       return creators[index];
   }
}
