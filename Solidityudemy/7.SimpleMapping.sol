pragma solidity ^0.5.13;

contract simpleMapping {

    /*
    Link something to something and provide it a variable name - myvar
    they are stored in array like structures
    ==> you reference them - myvar[]
    and specify position you want ie myvar[0]
    */

     mapping(uint => bool) public myMapping;
     mapping(address => bool) public myAddressMapping;

     function setValue(uint _index) public {
         myMapping[_index] = true;
     }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
}
