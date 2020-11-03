pragma solidity ^0.5.13;

contract StartStopUpdate{

    /*
    you want to pause the contract
    only the contract owner can enable it
    use a bool
    by dafault a bool is set to -- false
    add an additional require
    */



    address owner;
    constructor() public {
        owner = msg.sender;
        }

    bool public paused;
    function setPaused(bool _paused) public {
        paused = _paused;
    }

    function sendMoney() public payable{
        }

    function withdrawAllMoney(address payable _to) public {
        require(msg.sender == owner, " You are not the contract owner");
        require(paused != false, "Contract is locked");
        _to.transfer(address(this).balance);
        }
