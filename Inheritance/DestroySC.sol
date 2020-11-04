pragma solidity 0.5.12;

import "./Ownable.sol";

contract Destroyable is Owner {

  function destroy() public onlyOwner {             //modifier from Owner inherited here
    address payable receiver = msg.sender;
    selfdestruct(receiver);
  }
}