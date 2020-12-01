pragma solidity ^0.5.13;

contract StartStopUpdate{

    /*
    you only want the owner to specify who can withdraw funds
    do not want anyone else other than msg.sender
    normally you would do
        if address == msg.sender
            then {}
            else {}
    however solidity you use --> require
    declare constructor ie run once at contract creation to declare owner
    */

    address owner;
    constructor() public {
        owner = msg.sender;
        }


    function sendMoney() public payable{
        }

    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, " You are not the contract owner");
        _to.transfer(address(this).balance);
        }


}
