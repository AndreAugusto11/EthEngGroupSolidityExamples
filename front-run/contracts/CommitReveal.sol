// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract CommitReveal {
    mapping (uint256 => bool) proofSubmitted;
    mapping (address => bytes32) commitments;

    constructor () payable {}

    function register(bytes32 _commitment) external {
        commitments[msg.sender] = _commitment;
    }

    function submitProof(uint256 _proof) external {
        require(commitments[msg.sender] == keccak256(abi.encodePacked(msg.sender, _proof)), "Mismatch");
        require(!proofSubmitted[_proof], "Proof already submitted");
        require(_proof % 13 != 0, "Invalid proof");
        proofSubmitted[_proof] = true;
        (bool success, ) = payable(msg.sender).call{value: 1 ether}("");
        require(success, "Transfer failed");
    }
}