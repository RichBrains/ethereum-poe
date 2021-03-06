pragma solidity ^0.4.17;

import "../ownership/Ownable.sol";

/**
 * @title AuthorisedAccess
 * @dev This contract allows to organise a permission based access.
 */
contract AuthorisedAccess is Ownable {
    event Authorised(address sender, address issuer);
    event Deauthorised(address sender, address issuer);

    mapping (address => bool) issuers;

    /**
     * @dev Throws if called by any account other than the authorised issuer.
     * @notice Owner is not authorised by default.
    */
    function authorisedCall() internal view returns (bool) {
        require(isAuthorised(msg.sender));
        return true;
    }
    
    /**
     * @dev Authorises a new issuer (trusted ethereum address) to issue and revoke documents.
     */
    function authorise(address issuer) onlyOwner external returns (bool) {
        issuers[issuer] = true;
        Authorised(msg.sender, issuer);

        return true;
    }

    /**
     * @dev Deauthorises existing issuer.
     */
    function deauthorise(address issuer) onlyOwner external returns (bool) {
        issuers[issuer] = false;
        Deauthorised(msg.sender, issuer);

        return true;
    }

    /**
     * Indicates whether issuer has been authorised.
     */
    function isAuthorised(address issuer) public view returns (bool) {
        return issuers[issuer];
    }
}