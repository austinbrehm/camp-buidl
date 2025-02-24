// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// Create a contract for yield farming.
contract Farm{
    // Initialize state variables.
    address farmToken;
    address rewardToken;
    mapping(address user => uint balance) balances;
    mapping(address user => uint time) timeOfLastDeposit;

    constructor(address farmTokenAddress, address rewardTokenAddress){
        farmToken = farmTokenAddress;
        rewardToken = rewardTokenAddress;
    }

    // Create a function to deposit tokens.
    function deposit(uint amount) external{
        ERC20 depositToken = ERC20(depositTokenAdd);
        depositToken.transfer(address(this), amount);
        balances[msg.sender] += amount;
        timeOfLastDeposit[msg.sender] = block.timestamp;
    }

    function harvest() external{
        uint balance = balances[msg.sender];
        uint rate = 100;
        uint timePassed = block.timestamp - timeOfLastDeposit[msg.sender];

        // Give the user the reward token.
        uint reward = timePassed * rate * balance;
        ERC20 rewardToken = ERC20(rewardTokenAdd);
        rewardToken.transferFrom(address(this), msg.sender, reward);

    }
}