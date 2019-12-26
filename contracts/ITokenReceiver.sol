pragma solidity ^0.5.13;

interface ITokenReceiver {
	 function receiveApproval(address _from, uint256 _value, address _token, bytes calldata _data)
	 external;
}
