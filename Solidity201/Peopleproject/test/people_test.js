const People = artifacts.require("People");
const AssertionError = require("assertion-error");
const truffleAssert = require("truffle-assertions");

contract("People", async function(accounts){
  it("shouldn't create a person with age over 150 years", async function(){
    let instance = await People.deployed();
    // this actually passes the test in truffle ie converse of normal test because age ie 200 > 150
    await truffleAssert.fails(instance.createPerson("Bob", 200, 190, {value: web3.utils.toWei("1", "ether")}),
    // Force the contract to REVERT
    truffleAssert.ErrorType.REVERT);
    });
    // Add test to check for payment with createPerson
    // ie send 1000 wei which is lest that prescribed 1 eth
    it("should'nt create a person without accompanying payment >= 1 eth", async function(){
        let instance = await People.deployed();
        await truffleAssert.fails(instance.createPerson("Bob",50,190,{value: 1000}),truffleAssert.ErrorType.REVERT);
    });
    // Test that senior status gets set correctly for person >=65. This becomes a +ve test with assert
    it("test that senior person flag gets set for age >=65 ", async function(){
        let instance = await People.deployed();
        await instance.createPerson("Bob", 65, 190, {value: web3.utils.toWei("1", "ether")});
        let result = await instance.getPerson();
        assert(result.senior === true, "Senior level not set");
    });
    // Test that only the creator of a person can delete that person - negative test
    // account[0] will always be creator
    it("test if any account other than owner can delete person ", async function(){
        let instance = await People.deployed();
        //Create with accounts[1]
        await instance.createPerson("Bob", 50, 190, {from: accounts[1],value: web3.utils.toWei("1", "ether")});
        //Test for failure deleltePerson with accounts[1]
        await truffleAssert.fails(instance.deletePerson(accounts[1], {from: accounts[1]}), truffleAssert.ErrorType.REVERT);
    })
    // Now do the positive test to deletePerson with Creator
    it("test that only the creator of a person can delete that person ", async function(){
        let instance = await People.deployed();
        await instance.createPerson("Graeme", 50, 190, {from: accounts[0],value: web3.utils.toWei("1", "ether")});
        await truffleAssert.passes(instance.deletePerson(accounts[1], {from: accounts[0]}), truffleAssert.ErrorType.REVERT);
    })
});