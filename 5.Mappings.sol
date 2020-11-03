pragma solidity 0.5.12;
pragma solidity 0.5.12;

contract Mappings{
    // State variables

    //Struct ie list of objects
    struct Person{
        string name;
        uint age;
        uint height;
        }

    // initialise your mapping which is the users address to Person
    mapping(address => Person) public people;       // mapping to a Person; can change public to private

    function fnCreatePerson(string memory name, uint age, uint height) public {
         address creator = msg.sender;              // msg.sender - provides the eth address of the caller of the function
         //Create the Person
         Person memory newPerson;
         //Person( name, age, height));
         newPerson.name = name;
         newPerson.age = age;
         newPerson.height = height;
         // Now let creator point to newPerson
         people[creator] = newPerson;               // NNB reference the Person created by their address this is the mapping. Dont need to push
        }

    function fnGetPerson() public view returns (string memory name, uint age, uint height) {
        address creator = msg.sender;
        return (people[creator].name,  people[creator].age, people[creator].height);        // return 3 elements of the Person
    }



} 
