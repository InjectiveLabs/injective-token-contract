pragma solidity 0.5.2;

import "@openzeppelin/upgrades/contracts/Initializable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20Pausable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20Mintable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20Burnable.sol";

contract InjectiveToken is Initializable, ERC20Pausable, ERC20Detailed, ERC20Mintable, ERC20Burnable {
    function initialize(
        string memory name, string memory symbol, uint8 decimals, uint256 initialSupply, address initialHolder,
        address[] memory minters, address[] memory pausers
    ) public initializer {
        ERC20Detailed.initialize(name, symbol, decimals);

        // Mint the initial supply
        _mint(initialHolder, initialSupply);

        // Initialize the minter and pauser roles, and renounce them
        ERC20Mintable.initialize(address(this));
        _removeMinter(address(this));

        ERC20Pausable.initialize(address(this));
        _removePauser(address(this));

        // Add the requested minters and pausers (this can be done after renouncing since
        // these are the internal calls)
        for (uint256 i = 0; i < minters.length; ++i) {
            _addMinter(minters[i]);
        }

        for (uint256 i = 0; i < pausers.length; ++i) {
            _addPauser(pausers[i]);
        }
    }

}
