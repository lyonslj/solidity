pragma solidity ^0.5.13;

contract SendMoney2 {

    /*
    Global object - msg.value
    stores the amount transferred
   therefore you dont need function getBalance

   In the example Ether gets transferred from one of the addresses to the smart contract
   Then you want to transfer to your address
    */



    uint public balanceReceived;
    //Send money from one of the accounts to the smart contract
    function receiveMoney() public payable{
        balanceReceived += msg.value;
        }
    //after you assign 1 ether under value and click "receiveMoney"
    //then click get balance
    function getBalance() public view returns(uint) {
        return address(this).balance;
        }

    //withdraw Ether from the smart contract back to msg.sender ie you
    function withdrawMoney() public {
        address payable to = msg.sender;
        to.transfer(this.getBalance());
    }

    //Now specify address where to transfer monet to
    function transferMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }


}
