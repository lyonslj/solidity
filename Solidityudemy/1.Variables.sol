pragma solidity ^0.5.12;

contract workingWithVariables {

    uint256 public myUint;
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
        }

    bool public myBool;
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    string public myString;
    function setMyString(string memory _mySring) public {
        myString = _mySring;
    }


}
