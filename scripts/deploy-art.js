const hre = require("hardhat");

async function main() {
  const Marketplace = await hre.ethers.getContractFactory("ArtMarketplace");
  const marketplace = await Marketplace.deploy();
  await marketplace.deployed();
  console.log("Marketplace deployed to:", marketplace.address);

  const NFT = await hre.ethers.getContractFactory("ArtNFT");
  const nft = await NFT.deploy(marketplace.address);
  await nft.deployed();
  console.log("Nft deployed to:", nft.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
