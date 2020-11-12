const Helloworld = artifacts.require("Helloworld");             //speciy what to test

contract("Helloworld", async function(){                        //contract Helloworld
  it("should initialize correctly", async function(){
    let instance = await Helloworld.deployed();
    let message = await instance.getMessage();
    assert(message === "Message updated from deploy script.."     //message should get updated to what you have specified, note ===
    , "Message should be: Message updated from deploy script..");                        //js assert similar but not same as solidity
    }); 
    // add second test case
    it("should set the message correctly", async function(){    //description of test 
        let instance = await Helloworld.deployed();
        await instance.setMessage("Testing Message");
        let message = await instance.getMessage();
        assert(message === "Testing Message"
        , "Message should be the same as we set it to"); 
    });
});