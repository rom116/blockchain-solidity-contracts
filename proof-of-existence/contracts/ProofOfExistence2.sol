pragma solidity ^0.4.17;

// Proof ofExistence contract - version 2
contract ProofOfExistence2 {
	// State
	bytes32[] private proofs;

	// Store a proof of existence in the contract state
	// **transactional function**
	function storeProof(bytes32 proof) {
		proofs.push(proof);
	}

	// Calculate and store the proof for a document
	// **transactional function**
	function notarize(string document) {
		bytes32 proof = generateProofFor(document);
		storeProof(proof);
	}

	// Helper function to get a document's sha256
	// **read-only function**
	function generateProofFor(string document) constant returns (bytes32) {
		return sha256(document);
	}

	// Check if a document has been notarized
	// **read-only function**
	function checkDocument(string document) constant returns (bool) {
		bytes32 proof = generateProofFor(document);
		return hasProof(proof);
	}

	// returns true if proof is stored
	// *read-only function**
	// expensive gas to iterate through array
	function hasProof(bytes32 proof) constant returns (bool) {
		for (uint256 i = 0; i < proofs.length; i++) {
			if(proofs[i] == proof) {
				return true;
			}
		}
		
		return false;
	}
}
