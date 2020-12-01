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


contract InheritanceModifier3 is Owned{

    constructor() public {

        tokenBalance[owner] = 100;
        }

    mapping(address => uint) public tokenBalance;

    uint tokenPrice = 1 ether;

    function createNewToken() public onlyOwner {
        tokenBalance[owner]++;
        }
    function burnToken() public onlyOwner {
        tokenBalance[owner]--;
        }

    function purchaseToken() public payable {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "not enough tokens");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
        }

    function sendToken(address _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]);
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
        }
}
