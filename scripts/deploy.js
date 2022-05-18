const hre = require("hardhat");

async function main() {
  const CCToken = await hre.ethers.getContractFactory("CCToken");
  const ccToken = await CCToken.deploy();

  await ccToken.deployed();

  console.log("Token deployed to:", ccToken.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error)
      process.exit(1)
    })
  