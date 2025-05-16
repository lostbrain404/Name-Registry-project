# 🔐 NameRegistry Smart Contract

A simple Ethereum smart contract that allows users to **register unique names** by paying a **fixed fee (0.01 ETH)**. This contract demonstrates basic Solidity concepts like `struct`, `mapping`, `event`, and `payable` functions.

---

## 🧱 Contract Features

- Register a name by sending a small payment.
- Each name is **unique** and cannot be reused.
- Each address can only register **once**.
- Emits an event when a new registration occurs.
- Users can view their registered name using a getter function.

---

## 📦 Technologies Used

- **Solidity** `^0.8.30`
- Compatible with tools like **Hardhat**, **Remix**, or **Foundry**

---

## 🚀 Functions Overview

### 🔹 `registerName(string memory name)`
Registers a unique name for the sender.
- Requires payment of **at least 0.01 ETH**
- Fails if:
  - The name already exists
  - The sender already registered

### 🔹 `getMyName()`
Returns the name registered by the caller.

---

## 🔔 Event

```solidity
event UserRegistered(address indexed userWallet, string indexed userName);
