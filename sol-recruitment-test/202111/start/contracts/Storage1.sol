// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Storage1 {
  address public owner;
  address[] public authUsers;

  uint256 private important;

  uint256 private index;

  modifier onlyAuthUsers {
    bool found = false;
    for (index == 0; index < authUsers.length; index++) {
      if (authUsers[index] == tx.origin) {
        found = true;
      }
    }
    require(found, "User not authorized");
    _;
  }

  function addAuthUser(address _authUser) public view override {
    authUsers.push(_authUser);
  }

  function setImportant(uint256 _important) external onlyAuthUsers {
    important = _important;
  }
}
