// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {console} from "forge-std/Test.sol";

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable
    bool public isEnrolled = false;
    
    function register() external returns (uint256) {
        if (isEnrolled) {
            return 123;
        }
        isEnrolled = true;
        return 1000;
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        return IClassroomV2(msg.sender).isEnrolled() ? 123 : 1000;
    }
}

/* Problem 3 Interface & Contract */
contract StudentV3 {
    function register() external view returns (uint256) {
        // TODO: please add your implementaiton here
        return gasleft() > 7000 ? 1000 : 123;
    }
}
