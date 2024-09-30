
# MiniERC20

MiniERC20 is a simple ERC-20 smart contract that allows the owner to mint tokens for users, while users can transfer tokens between themselves and also burn their tokens.

## Description

This program is a simple contract written in Solidity, a programming language for developing smart contracts on the Ethereum blockchain. The smart contract imported the Openzeppelin ERC-20  and Ownable smart contract
``` javascript
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
```
and from the ERC-20 contract implemented the ```transfer```, ```mint``` and the ```burn``` functions.

- ```transfer```: allows a user to transfer their tokens to another user.
- ```mint```:  allows only the contract owner to mint tokens for users.
- ```burn```: allows users to burn their no-longer-needed tokens, which will be removed from the total supply of the token in circulation.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., MiniERC20.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MiniERC20 is ERC20, Ownable {


    constructor(string memory _name, string memory _symbol, address _owner)
        ERC20(_name, _symbol)
        Ownable(_owner)
    {}

    function transfer(address _to, uint256 _value)
        public
        override
        returns (bool)
    {
        address _owner = _msgSender();
        _transfer(_owner, _to, _value);
        return true;
    }

    function mint(address _recipient, uint256 _value) public onlyOwner {
        super._mint(_recipient, _value);
    }

    function burn(uint96 _value) external {
        _burn(_msgSender(), _value);
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.17" (or another compatible version), and then click on the "Compile MiniERC20.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MiniERC20" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it the contract.

## Authors

Michael Dean

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

