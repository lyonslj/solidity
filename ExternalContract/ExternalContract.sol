pragma solidity 0.5.12;



    // Define the external contract you neeed to interact with ie Helloworld
    // Get Helloworlds address from the VM
    // You want to call the function create person and from that pay eth across

    // Specify the interface ie contract you will interact with, and the function you will call
    // Interface
    contract HelloWorld{
            function createPerson(string memory name, uint age, unint height) public payable;
    }

    contract ExternalContract{

        // create state variable instance
        HelloWorld instance = HelloWorld(****Address********);          //Contract address you want to interact with

        function externalCreatePerson(string memory name, uint age, uint height) public payable{
                instance.createPerson.value(msg.value)(name, age, height);  //note value you are going to pay
            }

}