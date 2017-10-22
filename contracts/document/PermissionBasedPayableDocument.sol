pragma solidity ^0.4.17;

import "../core/AuthorisedAccess.sol";
import "./PublicPayableDocument.sol";

/**
 * @title PermissionBasedPayableDocument
 * @dev Charges a fixed fee (goes to the contract's owner) for document issue. 
 *      Owner can authorise/deauthorise any address to allow/disallow issue and revoke documents.
 */
contract PermissionBasedPayableDocument is PublicPayableDocument, AuthorisedAccess {
    /**
     * @dev Issues a document for a fixed fee.
     * @dev Can be called by the authorised issuer only.
     */
    function issueDocument(address recipient, bytes32 document) payable public returns (bool) {
        require(authorisedCall());
        super.issueDocument(recipient, document);
    }

    /**
     * @dev Revokes document and sets recipient as 0x0.
     * @dev Can be called by the authorised issuer only.
     */
    function revokeDocument(address recipient, bytes32 document) public returns (bool) {
        require(authorisedCall());
        super.revokeDocument(recipient, document);
    }
}