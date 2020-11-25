var web3 = new Web3(Web3.givenProvider);

$(document).ready(function() {
    window.ethereum.enable().then(function(accounts){
        contractInstance = new.web3.eth.Contract(abi,"0x26d1461066Da79f7d5F664FF149C0e6976257D76",{from: accounts[0]});
        console.log(contractInstance);
    });
    $("#add_data_button").click(inputData);

});

// Create function to input data - name, age, height
function inputData(){
    var name = $("#name_input").val();
    var age = $("#age_input").val();
    var height = $("#height_input").val();

    // This now needs to interact with SC via web3 Metamask and have the tx signed
var config = {
    value: web3.utils.toWei("1","ether")   //convert wei to eth
    };

contractInstance.methods.createPerson(name, age, height).send(config);

}
