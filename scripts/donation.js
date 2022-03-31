const hre = require('hardhat')
const ethers = hre.ethers
const donationArtifacts = require('../artifacts/contracts/Donation.sol/Donation.json')


async function main(){
    const[signer] = await ethers.getSigners()
    const donationAddr = '0x5FbDB2315678afecb367f032d93F642f64180aa3'

 const donationContract = new ethers.Contract(
    donationAddr,
    donationArtifacts.abi,
    signer
 )
    // const setGreetResult = await greeterContract.setGreet('Hello idiot!')
    // console.log(setGreetResult)
    // await setGreetResult.wait()

    const result = await donationContract.getGreet()
    console.log(result)
}

main()
    .then(()=>process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });