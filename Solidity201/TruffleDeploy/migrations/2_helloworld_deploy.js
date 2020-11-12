const Helloworld = artifacts.require("Helloworld");

module.exports = function (deployer, network, accounts) {            // specify network, and account from truffle for payment
  deployer.deploy(Helloworld).then(function(instance){
    // add amount payable wei, and the first account listed in truffle. Note done from setMessage  
    instance.setMessage("Message updated from deploy script..", {value: 1000000000, from: accounts[0]}).then(function(){
          console.log("Success");
      }).catch(function(err){console.log("error: " + err);
      });
    }).catch(function(err){console.log("Deploy failed " + err);
});
};