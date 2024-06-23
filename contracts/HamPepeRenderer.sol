// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "utils/SSTORE2.sol";
import "utils/LibString.sol";
import "auth/Owned.sol";
import "utils/Base64.sol";
import "contracts/HamPepeTraits.sol";

contract HamPepeRenderer is Owned {
    using LibString for uint256;

    HamPepeTraits traitsMetaData;

    address public traitsImagePointer;
    string description = 
    "1000 based Pepes living on Ham Chain L3";

    error TraitsImageAlreadySet ();

    constructor(HamPepeTraits _traitsMetaData) Owned(msg.sender) {
        traitsMetaData = _traitsMetaData;
    }

    function setTraitsImage(string calldata data) external onlyOwner {
        if (traitsImagePointer != address(0)) {
            revert TraitsImageAlreadySet();
        }
        traitsImagePointer = SSTORE2.write(bytes(data));
    }
}