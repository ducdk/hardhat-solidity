const hre = require("hardhat");

async function main() {
  const TokenLock = await hre.ethers.getContractFactory("TokenLock");
  const tl = await TokenLock.deploy();
  await tl.deployed();
  console.log("TokenLock deployed to:", tl.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
