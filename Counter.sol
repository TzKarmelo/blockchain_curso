// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Counter {
    // Variable de estado: almacena el contador
    uint256 public count = 0;
    // Evento que se emite cuando el contador cambia
    event CountChanged(uint256 newCount, string action);
    // Función para incrementar el contador
    function increment() public {
        count += 1;
        emit CountChanged(count, "increment");
    }
    // Función para decrementar el contador
    function decrement() public {
        // Protección: evita números negativos
        require(count > 0, "El contador no puede ser negativo");
        count -= 1;
        emit CountChanged(count, "decrement");
    }
    // Función para obtener el valor actual
    function getCount() public view returns (uint256) {
        return count;
    }
    // Función para reiniciar el contador
    function reset() public {
        count = 0;
        emit CountChanged(count, "reset");
    }
    // Función para sumar un número específico
    function add(uint256 amount) public {
        count += amount;
        emit CountChanged(count, "add");
    }
    // Función para restar un número específico
    function subtract(uint256 amount) public {
        require(count >= amount, "No hay suficientes unidades para restar");
        count -= amount;
        emit CountChanged(count, "subtract");
    }
    // Función para multiplicar el contador
    function multiply(uint256 factor) public {
        count *= factor;
        emit CountChanged(count, "multiply");
    }
    // Función para obtener el doble del contador
    function double() public view returns (uint256) {
        return count * 2;
    }
    // Función para obtener la mitad del contador (división entera)
    function half() public view returns (uint256) {
        return count / 2;
    }
    // Función para incrementar el contador
    function increment(uint256 amount) public {
        count += amount;
        emit CountChanged(count, "increment");
    }
    // Función para verificar si el contador es par
    function isEven() public view returns (bool) {
        return count % 2 == 0;
    }
    // Función para verificar si el contador es impar
    function isOdd() public view returns (bool) {
        return !isEven();
    }
    // Función para calcular el módulo del contador
    function modulo(uint256 divisor) public view returns (uint256) {
        require(divisor != 0, "El divisor no puede ser cero");
        return count % divisor;
    }
}
