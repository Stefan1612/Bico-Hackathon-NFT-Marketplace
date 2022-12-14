//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

// IMPORTS 
// debug tool
import "hardhat/console.sol";
// TokenURI Storage used to handle ipfs nft-links
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// LIBRARIES
// keeping state of tokenURI
import "@openzeppelin/contracts/utils/Counters.sol";

/// @dev Biconomy gasless transactions
import "./ERC2771Recipient.sol";


// ERROR MESSAGES
// caller is not the owner nor has approval for tokenID
error NotOwner(address sender, uint i);

// CONTRACTS
/// @title NFT contract for "Ape Family"
/// @author Stefan Lehmann/Stefan1612/SimpleBlock
/// @notice Contract used to create new NFT's and keep state of previous ones
/// @dev Basic erc721 contract for minting, saving tokenURI and burning tokens
contract NFT is ERC721URIStorage, ERC2771Recipient {
     /// BICONOMY 

    string public override versionRecipient = "v0.0.1";

    function _msgSender() internal override (Context, ERC2771Recipient) view returns (address) {
        return ERC2771Recipient._msgSender();
    }

    function _msgData() internal override (Context, ERC2771Recipient) view returns (bytes calldata) {
        return ERC2771Recipient._msgData();
    }

    /// @notice decrement, increment, current ID from Counter library
    using Counters for Counters.Counter;

    /// @notice keeping track of tokenIds
    Counters.Counter private s_tokenIds;

     /// @notice useless test Constant
    uint private constant TEST = 12;

    /// @notice address of the marketplace I want the this type of NFT to interact with
    address private immutable i_marketplace;

    /// @notice setting name, symbol to fixed values
    constructor(address _marketplace, address forwarder) ERC721("Ape Family", "APFA") {
        i_marketplace = _marketplace;
        _setTrustedForwarder(forwarder);
    }

    /// @notice mint function(createNFT)
    /// @return current tokenID
    function createNFT(string memory tokenURI) external returns (uint256) {
        // incrementing the id everytime after minting
        s_tokenIds.increment();
        // unique current ID
        uint256 currentTokenId = s_tokenIds.current();

        // ERC721 _mint
        _safeMint(_msgSender(), currentTokenId);

        // ERC721URIStorage _setTokenURI
        _setTokenURI(currentTokenId, tokenURI);

        // ERC721 setApprovalForAll to give marketplace access 
        setApprovalForAll(i_marketplace, true);

        return currentTokenId;
    }

    /// @notice burns NFT's
    /// @dev sends token to address(0)
    function burn(uint256 tokenId) external virtual {

        // In case require statements get more gas efficient in the future
       /*  require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721Burnable: caller is not owner nor approved"
        ); */

        if( !_isApprovedOrOwner(_msgSender(), tokenId)){
            revert NotOwner(_msgSender(), tokenId);
        }

        // sends token to address(0)
        _burn(tokenId);
    }
}
