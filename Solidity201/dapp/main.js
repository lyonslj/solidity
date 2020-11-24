var web3 = new Web3(Web3.givenProvider);

$(document).ready(function() {
    window.ethereum.enable().then(function(accounts){
        contractInstance = new.web3.eth.Contract(abi,"0x26d1461066Da79f7d5F664FF149C0e6976257D76",{from: accounts[0]});
        console.log(contractInstance);
    })

});
