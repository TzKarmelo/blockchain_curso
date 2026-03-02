// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleWallet {
    // Mapping: almacena el saldo de cada usuario
    // address => saldo en wei
    mapping(address => uint256) public balances;
    // Saldo total del contrato
    uint256 public totalBalance = 0;
    // Eventos
    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);
    event Transfer(address indexed from, address indexed to, uint256 amount);
    // Función para depositar Ether
    function deposit() public payable {
        require(msg.value > 0, unicode"El depósito debe ser mayor a 0");
        balances[msg.sender] += msg.value;
        totalBalance += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
    // Función para obtener el saldo de un usuario
    function getBalance(address user) public view returns (uint256) {
        return balances[user];
    }
    // Función para obtener el saldo del usuario actual
    function getMyBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
    // Función para retirar Ether
    function withdraw(uint256 amount) public {
        require(amount > 0, "El monto debe ser mayor a 0");
        require(balances[msg.sender] >= amount, "Saldo insuficiente");
        // Actualizar saldos
        balances[msg.sender] -= amount;
        totalBalance -= amount;
        // Enviar Ether (patrón pull over push)
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, unicode"La transferencia falló");
        emit Withdrawal(msg.sender, amount);
    }
    // Función para transferir entre usuarios
    function transfer(address recipient, uint256 amount) public {
        require(recipient != address(0), unicode"Dirección inválida");
        require(amount > 0, "El monto debe ser mayor a 0");
        require(balances[msg.sender] >= amount, "Saldo insuficiente");
        // Actualizar saldos
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
    }
    // Función para obtener el saldo total del contrato
    function getTotalBalance() public view returns (uint256) {
        return totalBalance;
    }
    // Función para obtener el número de usuarios activos
    // Nota: Esta es una aproximación simplificada
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
