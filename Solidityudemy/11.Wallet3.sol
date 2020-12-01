pragma solidity ^0.6.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

    /*
        Incorporate audited OpenZeppelin contract that does not have isOwner fn
    */

contract SharedWallet is Ownable {

    function isOwner() internal view returns(bool) {
        return owner() == msg.sender;
        }

    function withdrawMoney(address payable _to, uint _amount) public onlyOwner {
            _to.transfer(_amount);
    }

    receive() external payable { }
}
