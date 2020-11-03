pragma solidity ^0.5.12;

contract AddressAndBalance {

    address public myAddress;
    function setAddress(address _setAddress) public {
        myAddress = _setAddress;
        }
    function getBalance() public view returns(uint) {
        return myAddress.balance;
        }



}
