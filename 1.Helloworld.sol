pragma solidity 0.5.12; //declare your compiler

contract HelloWorld{
    // run in remix ie Ethereum IDE
    // State variables
    string public message = "HelloWorld";


    //Functions
    function fnGetMessage() public view returns(string memory){
        return message;
    }
}
