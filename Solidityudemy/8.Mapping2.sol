pragma solidity 0.5.13;

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

    function withdrawAllMoney(address payable _to) public {
        uint balanceToSend = balanceReceived[msg.sender];       // declare new variable, this is the amount in the mapping
        balanceReceived[msg.sender] = 0;                        // reset to 0
        _to.transfer(balanceToSend);                            // transfer amount sent in
        }
}
