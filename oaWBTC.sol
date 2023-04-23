// SPDX-License-Identifier: MIT
/*          

//  ██████  ███████ ██    ██ ██  ██████  ██    ██ ███████     ███    ███ ██ ███    ██ ██████  ███████ 
//  ██   ██ ██      ██    ██ ██ ██    ██ ██    ██ ██          ████  ████ ██ ████   ██ ██   ██ ██      
//  ██   ██ █████   ██    ██ ██ ██    ██ ██    ██ ███████     ██ ████ ██ ██ ██ ██  ██ ██   ██ ███████ 
//  ██   ██ ██       ██  ██  ██ ██    ██ ██    ██      ██     ██  ██  ██ ██ ██  ██ ██ ██   ██      ██ 
//  ██████  ███████   ████   ██  ██████   ██████  ███████     ██      ██ ██ ██   ████ ██████  ███████
                                                                                                                                                                                   
*/

// DISCLAIMER: The ERC20 token referred to in this statement has been created for accountancy purposes only
// and is not intended for trading or swapping. The token is designed to function similarly to a Synthetix asset,
// replicating, or attempting to replicate, the cash flows incident to ownership of WBTC,
// with a parity of 1 oaWBTC equaling 1 WBTC. This parity is a fixed and unchangeable feature of this ERC20 token.
// The creators of this token have no intention of changing the peg or parity in the future,
// and users should not rely on or expect any changes to be made to the token's parity.
// The creators of this token cannot be held liable for any damages, losses, or liabilities that may
// result from any misunderstanding or misrepresentation of the token's fixed parity.

pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20FlashMint.sol";

contract oaWBTC is ERC20, ERC20Burnable, Pausable, Ownable, ERC20FlashMint {
    constructor() ERC20("oaWBTC", "oaWBTC") {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(uint256 amount) public onlyOwner {
        _mint(msg.sender, amount);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, amount);
    }
}