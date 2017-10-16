pragma solidity ^0.4.17;

import "../ownership/Ownable.sol";

/**
 * @title Document
 * @dev This basic contract allows to issue documents.
 */
contract BasicDocument is Ownable {
    event DocumentIssued(address issuer, address recipient, bytes32 indexed document);

    struct DocumentBody {
        address issuer;
        address recipient;
        uint256 block;
    }

    mapping (bytes32 => DocumentBody) documents;

    /**
     * @dev Issues document.
     * @dev Anyone who knows the contract address can issue documents. 
     */
    function issueDocument(address recipient, bytes32 document) payable public returns (bool) {
        require(documents[document].issuer == address(0));

        documents[document].issuer = msg.sender;
        documents[document].recipient = recipient;
        documents[document].block = block.number;

        DocumentIssued(msg.sender, recipient, document);

        return true;
    }
}