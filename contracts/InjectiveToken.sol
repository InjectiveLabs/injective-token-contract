pragma solidity ^0.5.13;

import "@openzeppelin/upgrades/contracts/Initializable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20Pausable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20Mintable.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC20/ERC20Burnable.sol";
import "./ITokenReceiver.sol";

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

    // https://medium.com/official-amulet/paying-for-services-with-erc20-tokens-6c4313114128
    function approveAndCall(
        address _spender,
        uint256 _value,
        bytes memory _data
    )
        public
        returns (bool success)
    {
        require(isContract(_spender), "ERR_NON_EXISTING");
        super.increaseAllowance(_spender, _value);
        emit Approval(msg.sender, _spender, _value);
        ITokenReceiver(_spender).receiveApproval(msg.sender, _value, address(this), _data);
        return true;
    }

    // approveAndCallProxy is the same as approveAndCall,
    // but also takes proxy address as an argument, that means
    // approval can be issued for one contract (spender), but
    // the call will be made on another contract (proxy).
    //
    // This pattern allows upgradeable token spenders.
    function approveAndCallProxy(
        address _spender,
        address _proxy,
        uint256 _value,
        bytes memory _data
    )
        public
        returns (bool success)
    {
        require(isContract(_spender), "ERR_NON_EXISTING");
        require(isContract(_proxy), "ERR_NON_EXISTING");
        super.increaseAllowance(_spender, _value);
        emit Approval(msg.sender, _spender, _value);
        ITokenReceiver(_proxy).receiveApproval(msg.sender, _value, address(this), _data);
        return true;
    }

    function isContract(address _addr) private view returns (bool){
        uint32 size;
        assembly {
            size := extcodesize(_addr)
        }
        return (size > 0);
    }
}
