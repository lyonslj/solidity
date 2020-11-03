pragma solidity ^0.6.1;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

    /*
        Now add events
        So you can trap and get signals offchain

    */



contract Allowance is Ownable {

    function isOwner() internal view returns(bool) {
        return owner() == msg.sender;
        }

    // event - change of allowance
    //notice how you index them so they can be searched
    event AllowanceChanged(address indexed _forWho, address indexed _byWhom, uint _oldAmount, uint _newAmount);

    mapping (address => uint) public allowance;

    // now call the event
    function addAllowance(address _who, uint _amount) public onlyOwner {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount);
        allowance[_who] = _amount;
        }

    modifier ownerOrAllowed(uint _amount) {
        require(isOwner() || allowance[msg.sender] >= _amount, "You are not allowed!");
        _;
    }

    // now call the event
    function reduceAllowance(address _who, uint _amount) internal ownerOrAllowed(_amount) {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who] - _amount);
        allowance[_who] -= _amount;
        }


}

contract SharedWallet is Allowance {

    event moneySent(address indexed _beneficiary, uint _amount);
    event moneyReceived(address indexed _from, uint _amount);

    // reduce the allowance amount for Allowed and eclude owner
    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
            require(_amount <= address(this).balance, "Contract doesn't own enough money");
            if(!isOwner()) {
                reduceAllowance(msg.sender, _amount);
            }
            emit moneySent(_to, _amount);
            _to.transfer(_amount);
    }


    receive() external payable {
        emit moneyReceived(msg.sender, msg.value);
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
        }
}
