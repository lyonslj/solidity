pragma solidity 0.5.12;

contract HelloWorld{
    // State variables
    string public message = "HelloWorld";
    //uint public myNum = 123;                    // integer
    //bool public isHappy = true;                 //boolean
    //address public contractCreator = 0x8e52440219A79D08e69B53A178a9e1eAE14C62c4;
    uint[] public aNums = [1, 20, 34];

/* Here you
- create an array
- query the index of the array
- push a value to the array
- update a value of an array
*/

    //Functions
    function fnGetMessage() public view returns(string memory){
        return message;
        }
    // Create new function to set message with user input
    function fnSetMessage(string memory newMessage) public {
        message = newMessage;
        }
    function fnGetNumber(uint index) public view returns(uint){
        return aNums[index];
        }
    function fnSetNumber(uint newNumber, uint index) public {       //update a number
        aNums[index] = newNumber;
        }
    function fnAddToArray(uint newNumber) public {                  //add element to array
        aNums.push(newNumber);
        }

}
