pragma solidity ^0.6.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

    /*
        Add a function to track balance to prevent over withdrawing
    */

contract SharedWallet is Ownable {

    function isOwner() internal view returns(bool) {
        return owner() == msg.sender;
        }


    mapping (address => uint) public allowance;
    function addAllowance(address _who, uint _amount) public onlyOwner {
        allowance[_who] = _amount;
        }


    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed!");
        _;
    }

    // Create new function
    function reduceAllowance(address _who, uint _amount) internal ownerOrAllowed(_amount) {
        allowance[_who] -= _amount;
        }
    // reduce the allowance amount for Allowed and eclude owner
    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
            require(_amount <= address(this).balance, "Contract doesn't own enough money");
            if(!isOwner()) {
                reduceAllowance(msg.sender, _amount);
            }
            _to.transfer(_amount);
    }


    receive() external payable { }

    function getBalance() public view returns(uint) {
        return address(this).balance;
        }
}
