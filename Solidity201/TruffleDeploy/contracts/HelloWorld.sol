pragma solidity 0.5.12;

contract Helloworld {

    string message = "Helloworld";

    function getMessage() public view returns (string memory) {
            return message;

    }


}