pragma solidity ^0.5.13;

contract MappingsStructExample {

    // Add a mapping to track  how much was deposited and by who
    // Now instead of transferring everything out we only transfer out what was sent

    mapping(address => uint) public balanceReceived;

    function getBalance() public view returns(uint) {
        return address(this).balance;
        }

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
        }

     function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender] >= _amount, "insuffiecient funds");
        balanceReceived[msg.sender] -= _amount;
                _to.transfer(_amount);                            // transfer amount sent in
        }

    /*
    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender];       // declare new variable, this is the amount in the mapping
        balanceReceived[msg.sender] = 0;                        // reset to 0
        _to.transfer(balanceToSend);                            // transfer amount sent in
        }
        */
}
