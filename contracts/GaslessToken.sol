// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @dev Biconomy gasless transactions
import "./ERC2771Recipient.sol";


contract GaslessToken is ERC20, Ownable, ERC2771Recipient {

    
    /// BICONOMY 

    string public override versionRecipient = "v0.0.1";

    function _msgSender() internal override (Context, ERC2771Recipient) view returns (address) {
        return ERC2771Recipient._msgSender();
    }

    function _msgData() internal override (Context, ERC2771Recipient) view returns (bytes calldata) {
        return ERC2771Recipient._msgData();
    }



    constructor(address forwarder) ERC20("GaslessToken", "GLT") {
        _setTrustedForwarder(forwarder);
    }

    /// @dev actual tokenomics will be added later, for now we want to enable gasless txs.
    function mint(address to, uint256 amount) public  {
        _mint(to, amount);
    }
}