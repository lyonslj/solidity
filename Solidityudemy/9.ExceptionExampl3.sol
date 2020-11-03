pragma solidity >=0.5.11 <0.7.0;

contract ExceptionExample3 {

    // if your balance is not of the type uint256, but of the type uint64 – to save some storage costs.
    // If you send two times 10 Ether to your smart contract it will automatically roll over and wraparound
    // In balanceReceived you will not see 20 ether, rather 1553255926290448384
    // uint64 rolls over to 0 after reaching the maximum value of 18446744073709551616 – that’s around 18.44 Ether

    // use asserts to make sure we don’t roll over – in both directions!
    // When withdrawals happen, we don’t suddenly have more balance available than before
    // when deposits happen ensure that the balance after depositing is really higher than before.

    mapping(address => uint64) public balanceReceived;


    function receiveMoney() public payable {
       assert(balanceReceived[msg.sender] + uint64(msg.value) >= balanceReceived[msg.sender]);
            // 1st deposit -     0        +           10      >=                   10    : true
            // 2nd depost        10       +           10      >=                   1,5   : false
        balanceReceived[msg.sender] += uint64(msg.value);

        }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Yu have insufficient funds");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - _amount);
            balanceReceived[msg.sender] -= _amount;
            _to.transfer(_amount);

        }
}
}
