
const hre = require('hardhat')
const ethers = hre.ethers


async function main(){
    const[signer] = await ethers.getSigners()

    const Donation = await ethers.getContractFactory('Donation', signer)
    const donation = await Donation.deploy()
    await donation.deployed()
    console.log(donation.address)
}
//depack accounts writes in []

main()
.then(()=>process.exit(0))
.catch((error) => {
    console.error(error);
    process.exit(1);
});