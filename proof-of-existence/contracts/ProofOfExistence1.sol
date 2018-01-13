pragma solidity ^0.4.17;

// Proof of Existence contract - version 1
contract ProofOfExistence1 {
	// State
	bytes32 public proof;

	// Calculate and store the proof for a document.
	// **transactional function**
	// Transactional functions changes state, affect blockchain, and incur gas
	function notarize(string document) {
		proof = generateProofFor(document);
	} 

	// Helper function to get a document's sha256.
	// **read-only constant function**
	// Constant function does not change state and will not incur gas
	function generateProofFor(string document) constant returns (bytes32) {
		return sha256(document);
	}
}
