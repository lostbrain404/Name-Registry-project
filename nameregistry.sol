// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

/// @title Simple Name Registration Contract
/// @author ...
/// @notice Allows users to register unique names by paying a fixed fee
/// @dev Demonstrates use of structs, mappings, events, and payable functions

contract NameRegistry {

    /// @dev Represents user registration data
    struct User {
        address wallet;
        string name;
    }

    /// @dev Maps user address to their registration details
    mapping(address => User) private registeredUsers;

    /// @dev Tracks which names have already been taken
    mapping(string => bool) private nameTaken;

    /// @notice Emitted when a user successfully registers
    /// @param userWallet The wallet address of the user
    /// @param userName The name registered by the user
    event UserRegistered(address indexed userWallet, string indexed userName);

    /// @notice Registers a unique name for the sender
    /// @dev Requires a payment of at least 0.01 ETH and uniqueness of name/address
    /// @param name The name to register
    function registerName(string memory name) external payable {
        require(msg.value >= 0.01 ether, "Insufficient payment");
        require(bytes(registeredUsers[msg.sender].name).length == 0, "Already registered");
        require(!nameTaken[name], "Name already taken");

        // Save user details
        registeredUsers[msg.sender] = User(msg.sender, name);

        // Mark the name as taken
        nameTaken[name] = true;

        // Emit registration event
        emit UserRegistered(msg.sender, name);
    }

    /// @notice Returns the registered name of the sender
    /// @return The name associated with the caller's address
    function getMyName() public view returns (string memory) {
        return registeredUsers[msg.sender].name;
    }
}
