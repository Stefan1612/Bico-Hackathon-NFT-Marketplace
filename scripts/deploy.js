const hre = require("hardhat");
const {
  storeContractAddress,
  verifyContract,
  printEtherscanLink,
} = require("./helper-functions");

const { ethers, network } = hre;
let NftAddress = "";
const forwarderAddress = "0xE041608922d06a4F26C0d4c27d8bCD01daf1f792"; // Goerli
async function deploy(contractName, args = []) {
  const { chainId } = network.config;

  const CF = await ethers.getContractFactory(contractName);
  const contract = await CF.deploy(...args);

  await contract.deployed();
  await storeContractAddress(contract, contractName);
  await verifyContract(contract, args);

  console.log("Deployer:", (await ethers.getSigners())[0].address);
  console.log(`${contractName} deployed to:`, contract.address);
  NftAddress = contract.address;
  printEtherscanLink(contract.address, chainId);
}

async function main() {
  await deploy("NftMarketPlace", [forwarderAddress]);
  await deploy("NFT", [NftAddress, forwarderAddress]);
  await deploy("GaslessToken", [forwarderAddress]);
  console.log(NftAddress);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
