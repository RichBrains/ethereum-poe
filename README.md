# Smart contract to prove the existence of documents

This contract allows you and your organisation to store documents unique identifiers in the Ethereum blockchain to prove their existance. The key advantages are anonymity, privacy, and getting a decentralized proof which can't be erased or modified by anyone (third parties or governments).

## How it works

You may use ready to work builders to setup your smart contract via transaction, without compile and deploy process.

Builder name and description | Builder address | Service fee | Abi for created contract
-----------------------------|-----------------|-------------|-------------------------
`PublicDocumentBuilder` — anyone who knows the contract address can issue and revoke documents. |[0x0](https://etherscan.io/address/0x0)| 0.1 ETH |[PublicDocument.json](/build/contracts/PublicDocument.json)
`PrivateDocumentBuilder` — only contract's owner can issue and revoke documents. |[0x0](https://etherscan.io/address/0x0)| 0.1 ETH |[PrivateDocument.json](/build/contracts/PrivateDocument.json)
`PermissionBasedDocumentBuilder` — owner can authorise/deauthorise any address to allow/disallow issue and revoke documents. |[0x0](https://etherscan.io/address/0x0)| 0.1 ETH |[PermissionBasedDocument.json](/build/contracts/PermissionBasedDocument.json)
`PublicPayableDocumentBuilder` — charges a fixed fee (goes to the contract's owner) for document issue. Anyone who knows the contract address can issue and revoke documents. |[0x0](https://etherscan.io/address/0x0)| 0.1 ETH |[PublicPayableDocument.json](/build/contracts/PublicPayableDocument.json)
`PermissionBasedPayableDocumentBuilder` — charges a fixed fee (goes to the contract's owner) for document issue. Owner can authorise/deauthorise any address to allow/disallow issue and revoke documents. |[0x0](https://etherscan.io/address/0x0)| 0.1 ETH |[PermissionBasedPayableDocument.json](/build/contracts/PermissionBasedPayableDocument.json)

## Usage

- `issueDocument` issues a `document` to a `recipient`. Fires `DocumentIssued` event.
- `revokeDocument` revokes a `document` and sets a recipient as 0x0. Fires `DocumentRevoked` event.
- `transferDocument` transfers a `document` from the current `owner` to a new `recipient`. Fires `DocumentTransfered` event.
- `verifyDocument` verifies if the `document` belongs to the given `recipient`.
- `getDocument` returns `document's` information.
- `setIssuePrice` sets a fixed fee for document issue (only payable contracts). Fires `NewPriceSet` event.
- `authorise` authorises new `issuer` (trusted ethereum address) to issue and revoke documents. Fires `Authorised` event.
- `deauthorise` deauthorises `issuer`. Fires `Deauthorised` event.
- `isAuthorised` indicates whether `issuer` has been authorised.
- `transferOwnership` allows the current owner to transfer control of the contract to a `newOwner`. Fires `OwnershipTransferred` event.