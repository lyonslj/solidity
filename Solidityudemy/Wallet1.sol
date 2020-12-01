pragma solidity ^0.6.1;

contract SharedWallet {

    /*
        1 - Anyone can deposit funds,
            Fallback Function. A contract can have exactly one unnamed function.
            This function cannot have arguments, cannot return anything and has to have **external** visibility.
            It is executed on a call to the contract if none of the other functions match the given function identifier
            (or if no data was supplied at all).
            /prior sol0.6 the receive function is the funciton() external payable

    */

    receive() external payable {
    }

    /*
        2   -   Withdraw money
                Owner unlimited
                Shared User - limited to allowance
    */

    function withdrawMoney(address payable _to, uint _amount) public {
                _to.transfer(_amount);                            // transfer amount sent in
        }


}
