# lottery-smart-contract

Imagine you want to create a lottery where people can enter by sending money to a specific address. You don't want to rely on any third-party services to manage the lottery, and you want it to be completely transparent and decentralized.

That's where this contract comes in. This contract is written in Solidity, which is used for creating smart contracts on the Ethereum network.

Here's how it works:

When you deploy the contract, you become the "manager" of the contract. This means you have special privileges, such as the ability to select the winner of the lottery and transfer the prize money.

Anyone can enter the lottery by sending 1 Ether to the contract's address. Ether is the cryptocurrency used on the Ethereum network, so people need to have some Ether in order to participate.

Once at least 3 people have entered the lottery, the manager can select a random winner. This is done using a special function in the contract that generates a random number based on the current block's difficulty, timestamp, and the number of participants.

The contract then transfers all the money in the contract to the winner's address. The winner is selected randomly, so it's fair and transparent.

Finally, the contract resets the participants array, so that people can enter the lottery again.

That's the basic idea of this contract. It's a simple way to create a decentralized lottery on the Ethereum network, without relying on any third-party services or intermediaries.


## what each function does:

1. constructor(): Initializes the contract by setting the manager address to the address that deploys the contract.

2. receive() external payable: This function is called whenever someone sends Ether to the contract address. It requires that the transaction value is exactly 1 Ether, and adds the sender's address to the participants array.

3. getBalance() public view returns (uint): Returns the current balance of the contract, but only the manager of the contract is allowed to view this balance.

4. random() public view returns (uint): Generates a random number using the current block's difficulty, timestamp, and the number of participants. This function is used to select the winner.

5. selectWinner() public: Selects a random winner from the participants array using the random() function. If there are at least 3 participants, the contract transfers the entire balance to the winner's address, and resets the participants array to an empty array. Only the manager of the contract can call this function.
