// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

contract NFT{
    // Initialize state variables.
    struct Monster{
        uint power;
        uint defense;  
        bool isEvil;
    }
    
    mapping (uint => address) idToOwner;    // Store the owner of the NFT.
    mapping (uint => Monster) monsters;    // Store the NFT data. 
    uint counter = 0;

    // Create a function to mint an NFT. 
    function mint(uint _power, uint _defense, bool _isEvil) external{
        idToOwner[counter] = msg.sender;
        
        // Initialize data for NFT. 
        monsters[counter] = Monster(_power, _defense, _isEvil);

        counter++;
    }
    
    // Create a function to transfer an NFT. 
    function transfer(address to, uint id) external{
        // Check if the sender owns the NFT.    
        require(idToOwner[id] == msg.sender, "You do not own this NFT");

        // Check if the recipient is not 0x0000000..00.
        require(to != address(0), "Invalid address");

        // Transfer the NFT.
        idToOwner[id] = to;
    }

    // Create a function to get the NFT.
    function getMonster(uint id) external view returns(Monster memory){
            return monsters[id];
    }

    // Create a function to update NFT data for power attribute.
    function updatePower(uint id, uint _power) external{
        // Check if the sender owns the NFT.
        require(idToOwner[id] == msg.sender, "You do not own this NFT");

        // Update the power attribute.
        monsters[id].power = _power; 
    }

    // Create a function to update NFT data for defense attribute.
    function updateDefense(uint id, uint _defense) external{
        // Check if the sender owns the NFT.counter
        require(idToOwner[id] == msg.sender, "You do not own this NFT");

        // Update the defense attribute.
        monsters[id].defense = _defense;
    }

    // Create a function to update NFT data for isEvil attribute. 
    function updateIsEvil(uint id, bool _isEvil) external{
        // Check if the sender owns the NFT.
        require(idToOwner[id] == msg.sender, "You do not own this NFT");

        // Update the isEvil attribute.
        monsters[id].isEvil = _isEvil;
    }
}
