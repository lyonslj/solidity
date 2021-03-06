pragma solidity 0.5.12;

contract Helloworld {

    string message = "Helloworld";

    function getMessage() public view returns (string memory) {
            return message;
    }

    function setMessage(string memory newMessage) public payable {
        message = newMessage;
        require(msg.value >= 1000000000 wei);
    }

}