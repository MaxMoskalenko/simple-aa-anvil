// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {TestERC20} from "contracts/TestERC20.sol";

contract DeployAndFundERC20Script is Script {
    TestERC20 public token;

    function setUp() public {}

    function run(uint32 deployerIndex, string memory name, string memory symbol, uint8 decimals, string memory mnemonic) public {
        (address gasProvider, ) = deriveRememberKey(mnemonic, 0);
        vm.startBroadcast(gasProvider);

        (address deployer, ) = deriveRememberKey(mnemonic, deployerIndex);

        payable(deployer).transfer(0.1 ether);

        vm.stopBroadcast();
        vm.startBroadcast(deployer);

        token = new TestERC20(name, symbol, decimals, type(uint256).max);

        for (uint32 i = 0; i < 15; i++) {
            address mintTo = vm.createWallet(vm.deriveKey(mnemonic, i)).addr;
            token.mint(mintTo, type(uint128).max);
        }

        vm.stopBroadcast();
    }
}
