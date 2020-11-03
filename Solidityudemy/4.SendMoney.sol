pragma solidity ^0.5.13;

contract SendMoney {


    //Send money from one of the accounts to the smart contract
    function receiveMoney() public payable{

        }
    //after you assign 1 ether under value and click "receiveMoney"
    //then click get balance
    function getBalance() public view returns(uint) {
        return address(this).balance;
        }



}
