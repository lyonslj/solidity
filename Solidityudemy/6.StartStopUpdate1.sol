pragma solidity ^0.5.13;

contract StartStopUpdate{

    /*
    payment from msg.sender --> contract --> address
    */




    function sendMoney() public payable{
        }

    function withdrawAllMoney(address payable _to) public {
        _to.transfer(address(this).balance);
        }


}
