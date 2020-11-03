pragma solidity 0.5.12;

contract HelloWorld{
    // State variables
    string public message = "HelloWorld";


    //Functions
    function fnGetMessage() public view returns(string memory){
        return message;
    }
    // Create new function to set message with user input
    function fnSetMessage(string memory newMessage) public {
        message = newMessage;
    }
}  
