const hre = require("hardhat");

async function main() {
  const CCNFT = await hre.ethers.getContractFactory("ArtCcNFT");
  const ccNFT = await CCNFT.deploy();

  await ccNFT.deployed();

  console.log("Token deployed to:", ccNFT.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error)
      process.exit(1)
    })
  