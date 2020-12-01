pragma solidity ^0.6.1;

contract SharedWallet {

    /*
        1) Now only allow the owner to withdraw all funds
        ie user who created sc ==> constructor
        2) Add modifier to restrict all withdrawal to owner

    */

    address owner;
    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "you are not the sc owner");
        _;
    }

    receive() external payable {
    }


    function withdrawMoney(address payable _to, uint _amount) public onlyOwner {
                _to.transfer(_amount);                            // transfer amount sent in
        }


}
