pragma solidity 0.5.12;

contract Owner {

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






}