// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenLock is OwnableUpgradeable, IERC20 {
  ERC20 public token;
  uint256 public depositDeadline;
  uint256 public lockDuration;

  string public name;
  string public symbol;
  uint256 public override totalSupply;
  mapping(address => uint256) public override balanceOf;

  error ExceedsBalance();
  error DepositPeriodOver();
  error LockPeriodOngoing();
  error TransferFailed();
  error NotSupported();

  function initialize(
    // address _owner
    // address _token,
    // uint256 _depositDeadline,
    // uint256 _lockDuration,
    // string memory _name,
    // string memory _symbol
  ) public initializer {
    __Ownable_init();
    transferOwnership(0x481c0E7B2F0b8B0936F5f962fd19453089D547E0);
    token = ERC20(0xDf117017F6BB85f74655Cf6fb0B6573A993c038a);
    depositDeadline = 100000000000000000000;
    lockDuration = 100000000000000000000;
    name = 'CCToken';
    symbol = 'CC';
    totalSupply = 0;
  }

  function deposit(uint256 amount) public {
    if (block.timestamp > depositDeadline) {
      revert DepositPeriodOver();
    }

    balanceOf[msg.sender] += amount;
    totalSupply += amount;

    if (!token.transferFrom(msg.sender, address(this), amount)) {
      revert TransferFailed();
    }

    emit Transfer(msg.sender, address(this), amount);
  }

  function withdraw(uint256 amount) public {
    if (
      block.timestamp > depositDeadline &&
      block.timestamp < depositDeadline + lockDuration
    ) {
      revert LockPeriodOngoing();
    }
    if (balanceOf[msg.sender] < amount) {
      revert ExceedsBalance();
    }

    balanceOf[msg.sender] -= amount;
    totalSupply -= amount;

    if (!token.transfer(msg.sender, amount)) {
      revert TransferFailed();
    }

    emit Transfer(address(this), msg.sender, amount);
  }

  function decimals() public view returns (uint8) {
    return token.decimals();
  }

  function transfer(address, uint256) external pure override returns (bool) {
    revert NotSupported();
  }

  function allowance(address, address)
    external
    pure
    override
    returns (uint256)
  {
    revert NotSupported();
  }

  function approve(address, uint256) external pure override returns (bool) {
    revert NotSupported();
  }

  function transferFrom(
    address,
    address,
    uint256
  ) external pure override returns (bool) {
    revert NotSupported();
  }
}