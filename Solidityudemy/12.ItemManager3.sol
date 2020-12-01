pragma solidity ^0.6.0;

contract ItemManager{

  /*
  Contract Outline
  enum - to know state of item, delivery and Payment
  struct - to know what the item is
          - its _price
          - state from enum
  mapping - for dealing with the Item
  3 Functions
          1. Item
          2. Payment
          3. Delivery

  */

    enum SupplyChainSteps{Created, Paid, Delivered}

    struct S_Item {
      ItemManager.SupplyChainSteps _step;
      string _identifier;
      uint _priceInWei;
      }

    mapping(uint => S_Item) public items;
    uint index;



    function createItem(string memory _identifier, uint _priceInWei) public {

      }

    function triggerPayment(uint _index) public payable {

      }

    function triggerDelivery(uint _index) public {

      }
}
