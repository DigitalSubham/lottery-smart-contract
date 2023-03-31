// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

contract lottery {
    // declare variables
    address public manager; // manager address
    address payable[] private participants; // dynamic array to store participant addresses

    constructor() {
        // set the manager address to the address that deploys the contract
        manager = msg.sender;
    }

    receive() external payable {
        // only allow transactions with a value of exactly 1 ether
        require(msg.value == 1 ether);
        // add the sender's address to the participants array
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns (uint) {
        // only allow the manager to view the contract's balance
        require(msg.sender == manager);
        // return the balance of the contract
        return address(this).balance;
    }

    function random() public view returns (uint) {
        // generate a random number using the current block's difficulty, timestamp, and the number of participants
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants.length)));
    }

    function selectWinner() public {
        // only allow the manager to select the winner and transfer funds
        require(msg.sender == manager);
        // require that at least 3 participants have entered the lottery
        require(participants.length >= 3);

        // declare the winner variable
        address payable winner;
        // generate a random number
        uint r = random();
        // calculate the index of the winner in the participants array
        uint index = r % participants.length;
        // select the winner from the participants array using the index
        winner = participants[index];
        // transfer the entire contract balance to the winner
        winner.transfer(getBalance());
        // reset the participants array to an empty array
        participants = new address payable[](0);
    }
}
