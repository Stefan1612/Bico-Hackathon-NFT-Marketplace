## Status

The NFT Marketplace is currently running and fully functional on Goerli at

1. NFT Market:

2. NFT:

The Website is online and running at [Website](https://gilded-gecko-470388.netlify.app/)

## Any questions? Contact me

Email: simpleblock4@protonmail.com
Discord: SimpleBlock#6604

## Biconomy

### Demo videos: 

NFT Marketplace: hhttps://www.youtube.com/watch?v=zYdKS_B3RJo

SKD Hyphen: https://www.youtube.com/watch?v=cViRhJu1qIM

### Hyphen Widget

The Biconomy Hyphen Widget allows for fast and easy cross chain movement of funds. You can easily with a few clicks and seconds transfer your
Tokens from one network to another

Biconomy docs: https://docs.biconomy.io/products/hyphen-instant-cross-chain-transfers/hyphen-widget

Added at: [Code](https://github.com/Stefan1612/Bico-Hackathon-NFT-Marketplace/blob/master/src/Components/CrossChainTransfer.js)

### Gasless Transactions 

This NFT allows party gasless NFT minting,selling and buying (mintNFT(), sellNFT(), buyNFT()) thanks to biconomy (only the marketplace itself and not NFT contract is currently gasless, because of the nature of my contract setup only the second transaction you need to accept for minting, etc... will be gasless (you still have to pay 0.002 eth fee to the contract to the owner when minting))

Biconomy docs: https://docs.biconomy.io/products/enable-gasless-transactions/choose-an-approach-to-enable-gasless/eip-2771

Added at: [Code](https://github.com/Stefan1612/Bico-Hackathon-NFT-Marketplace/blob/master/src/App.js)

And all contracts modified accordingly: [Code](https://github.com/Stefan1612/Bico-Hackathon-NFT-Marketplace/tree/master/contracts)

## Approach

A NFT Marketplace running currently on Goerli. Let's you mint, sell and buy NFT's. During the minting we store the Metadata on IPFS and only store the TokenURI on-chain.

## Project local setup

1. git clone repo
2. generate .env
3. npm i
4. npm start
5. If you wanna test with your own contract instances you can redeploy on goerli via:
   npx hardhat run scripts/deploy.js --network goerli

## What is a NFT Marketplace?

This DApp allows you mint, buy and sell NFT's from the "Ape Family" contract.

- NFT's uploaded to IPFS
- Generated Transfer History with Covalent API, ethers receipt, tokenURI
- sell, buy with NFT Marketplace contract
- mint, transfer and set TokenURI with NFT contract


## Covalent API

Covalent was used to generate: [this whole section](https://github.com/Stefan1612/Covalent-NFT-Marketplace/blob/master/src/Components/Transfers.js)

The actual API call
https://github.com/Stefan1612/Covalent-NFT-Marketplace/blob/5aa24e0f444a21256bf8e687a885b9cf8b9fb640/src/Components/Transfers.js#L30-L34

## License

This project is released under a GPLv3 compatible license

## Stack

### Blockchain Technologies

1. Environment - [Hardhat](https://hardhat.org/)
2. File Storage - [IPFS](https://github.com/ipfs/js-ipfs/tree/master/packages/ipfs-http-client#install)
3. Client - [ethers.js](https://docs.ethers.io/v5/)

### Frontend

- [React](https://reactjs.org/)
- [ethers.js](https://docs.ethers.io/v5/)
- [MUI: React UI Library](https://mui.com/)
- [Bootstrap]
- [Covalent](https://www.covalenthq.com/docs/api/)

## Backend

- [Netlify](https://www.netlify.com/): Website host
- [Node.js](https://nodejs.org/en/)
