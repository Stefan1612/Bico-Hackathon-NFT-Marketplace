const hre = require("hardhat");
const {
  storeContractAddress,
  verifyContract,
  printEtherscanLink,
} = require("./helper-functions");

const { ethers, network } = hre;
let NftAddress = "";
const forwarderAddress = "0xF82986F574803dfFd9609BE8b9c7B92f63a1410E"; // Kovan
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
  await deploy("NFT", [NftAddress]);
  console.log(NftAddress);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
