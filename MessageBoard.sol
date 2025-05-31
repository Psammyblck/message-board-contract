// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Simple On-Chain Message Board
/// @author YourName
/// @notice This contract lets the owner set and update a message stored on the blockchain
contract MessageBoard {
    // The message stored on-chain
    string public message;
    
    // Address of the contract owner
    address public owner;

    /// @notice Sets the initial message and the contract deployer as owner
    /// @param initialMessage The first message to store on deployment
    constructor(string memory initialMessage) {
        message = initialMessage;
        owner = msg.sender;  // Save deployer's address as owner
    }

    /// @notice Modifier to restrict access to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    /// @notice Update the message, only callable by the owner
    /// @param newMessage The new message to store
    function updateMessage(string memory newMessage) public onlyOwner {
        message = newMessage;
    }
}
