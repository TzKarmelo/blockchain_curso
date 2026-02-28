// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract HelloWorld {
// Variable de estado: se almacena en la blockchain
string public message = "Hola, Solidity!";
string public owner = "0x70997970C51812dc3A010C7d01b5";
// Función para obtener el mensaje
function getMessage() public view returns (string memory) {
return message;
}
// Función para cambiar el mensaje
function setMessage(string memory newMessage) public {
message = newMessage;
}
// Función reset
function resetMessage() public {
message = "Hola, Solidity!";
}
}