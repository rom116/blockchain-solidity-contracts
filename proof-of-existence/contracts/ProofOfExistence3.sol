pragma solidity ^0.4.17;

// Proof of Existence contract - version 3
contract ProofOfExistence3 {
	// State
	mapping (bytes32 => bool) private proofs;

	// Store a proof of existence in the contract state.
	function storeProof(bytes32 proof) {
		proofs[proof] = true;
	}

	// Calculate and store the proof for a document
	function notarize(string document) {
		var proof = generateProofFor(document);
		storeProof(proof);
	}

	// Helper function to get a document's sha256
	function generateProofFor(string document) constant returns (bytes32) {
		return sha256(document);
	}

	// Check to see if document has been notarized
	function checkDocument(string document) constant returns (bool) {
		var proof = generateProofFor(document);
		return hasProof(proof);
	}

	// Returns true if proof is stored
	function hasProof(bytes32 proof) constant returns (bool) {
		return proofs[proof];
	}
}
