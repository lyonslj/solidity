pragma solidity 0.5.12;

contract Structs{
    // State variables

    //Struct ie list of objects
    struct Person{
        uint id;
        string name;
        uint age;
        uint height;
        }

    Person[] public people;                // define your array people of class Person



    function fnCreatePeople(string memory name, uint age, uint height) public {
        // youonly add 3 inputs
        //id generated as index position ie people.length
        //create people by pushing to array
        // ***NNNB note "string memory" and "public"
        people.push(Person(people.length, name, age, height));
        }



}  
