const hre = require("hardhat");

async function main() {
  const a = await hre.ethers.getContractFactory("StakingToken");
  const b = await a.deploy();
  await b.deployed();
  console.log("Marketplace deployed to:", b.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
