# Lottery-smart-contract

This contract allows multiple players to enter a lottery and select a random winner who will receive the total balance of the contract.

---

## **Contract Explanation**

### **State Variables**
1. **`owner`**:  
   - Stores the address of the contract owner who deployed the contract.  
   - Only the owner can perform specific actions like picking the winner or checking the balance.

2. **`players`**:  
   - A dynamic array of addresses that keeps track of the players participating in the lottery.

---

### **Constructor**
- The `constructor` function sets the `owner` to the address that deployed the contract.  
  **Purpose**: Ensures that only the owner has special privileges.

---

### **Functions**

1. **`receive`** (Special Function):  
   - Triggered when someone sends Ether to the contract.  
   - Ensures that only the `owner` can add a player to the lottery.  
   **Action**: Adds the sender (`msg.sender`) to the `players` array if they are the owner.  

2. **`getbalance`**:  
   - Returns the total Ether balance of the contract.  
   - Can only be called by the `owner`.  
   **Purpose**: Allows the owner to check how much Ether is available in the contract.

3. **`random`** (Internal Function):  
   - Generates a random number using blockchain properties like `block.prevrandao` and `block.timestamp`.  
   **Purpose**: This random number is used to pick the winner of the lottery.

4. **`pickwinner`**:  
   - Selects a random winner from the `players` array.  
   - Transfers the entire contract balance to the selected winner.  
   - Resets the `players` array to start a new lottery.  
   **Requirements**:  
     - Only the `owner` can call this function.  
     - There must be at least 3 players in the lottery.  

---

## **Deployment and Usage**

### Usage

1. **Add Players**:
   - Send Ether to the contract from the `owner` account to add participants. The `receive` function will automatically add them.

2. **Check Contract Balance**:
   - Use the `getbalance` function to see how much Ether is currently in the contract. Only the `owner` can call this.

3. **Pick a Winner**:
   - Call the `pickwinner` function to randomly select a winner from the `players` array. The winner will receive the entire contract balance.
