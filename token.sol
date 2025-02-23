// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract Token{
    // Initialize state variables.
    mapping (address => uint) balances;    // Store user balances.
    address owner;
    string name;
    string symbol;

    constructor(){
        // Assign the total supply of token to the contract creator.
        balances[msg.sender] = 5;
        owner = msg.sender;
        name = "New Token";
        symbol = "NT";
    }
    
    // Create function to transfer token. 
    function transfer(address to, uint amount) external {
        // Check if the sender has enough token.
        require(balances[msg.sender] >= amount, "Not enough token");

        // Check for overflows.
        require(balances[to] + amount >= balances[to], "Overflow error");
        
        // Subtract the amount from the sender.
        balances[msg.sender] -= amount;

        // Add the amount to the recipient.
        balances[to] += amount;
    }

    // Create function to check the balance of an address.
    function getBalance(address user) external view{
        balances[user];
    }
}