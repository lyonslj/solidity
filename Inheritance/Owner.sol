pragma solidity 0.5.12;

contract Owner {

    address public owner;

    modifier onlyOwner(){
        require(msg.sender == owner);
        _; //Continue execution
    }

    // constructor is run when the contract is created
    
    constructor() public {
        owner = msg.sender;
        }






}