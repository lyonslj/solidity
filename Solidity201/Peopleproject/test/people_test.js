const People = artifacts.require("People");
const truffleAssert = require("truffle-assertions");

contract("People", async function(){
  it("shouldn't create a person with age over 150 years", async function(){
    let instance = await People.deployed();
    // this actually passes the test in truffle ie convers of normal test because age ie 200 > 150
    await truffleAssert.fails(instance.createPerson("Bob", 200, 190, {value: web3.utils.toWei("1", "ether")}),
    // Force the contract to REVERT
    truffleAssert.ErrorType.REVERT);
    })
});