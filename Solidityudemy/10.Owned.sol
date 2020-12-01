pragma solidity ^0.5.11;

    // setup 2 contracts
    // the one contract calls - inherits the other
contract Owned {

     address owner;

    modifier onlyOwner {
        require(msg.sender == owner, "You are not allowed");
        _;
        }

    constructor() public {
        owner = msg.sender;
        }
}
