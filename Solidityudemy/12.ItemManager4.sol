pragma solidity ^0.6.0;

contract ItemManager{

  /*
  Build out the functions
  */

    enum SupplyChainState{Created, Paid, Delivered}

    struct S_Item {
      ItemManager.SupplyChainSteps _step;
      string _identifier;
      uint _priceInWei;
      }

    mapping(uint => S_Item) public items;         // Everything gets refereneced as "item"
    uint index;

    function createItem(string memory _identifier, uint _itemPrice) public {
      items[itemIndex]._identifier = _identifier;
      items[itemIndex]._itemPrice = _itemPrice;
      items[itemIndex]._state = SupplyChainState.Created;
      itemIndex++;

      }

    function triggerPayment(uint _index) public payable {
        require(items[_itemIndex]._itemPrice == msg.value, "Only full payments accepted" );
        require(items[_itemIndex]._state == SupplyChainState.Created, "Item being processed in supply chain" );      // Not paid for
        items[_itemIndex]._state = SupplyChainState.Paid;
      }

    function triggerDelivery(uint _itemIndex) public {
        require(items[_itemIndex]._state == SupplyChainState.Paid, "Item being processed in supply chain" );
        items[_itemIndex]._state == SupplyChainState.Delivered;
      }
}
