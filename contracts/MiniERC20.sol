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