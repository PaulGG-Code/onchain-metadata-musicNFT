# Music NFT Metadata Stored Onchain

- 73 Music NFT attributes stored on chain in your music nft metadata.

```diff
- WARNING: these contracts are unaudited
```

### You Newest Tool for Music NFTs (100% on chain)

- [Your Music NFT Smart Contract (ERC721)](https://mumbai.polygonscan.com/address/0x1c517d7037ce732bfd5dceb2322904d7db5453f0#code).
- [Your Music NFT in OpenSea](https://testnets.opensea.io/assets/mumbai/0x1c517d7037ce732bfd5dceb2322904d7db5453f0/1)
- Works out of the box.


### Get Started

To add music NFT metadata to your next music NFT drop, just

1. `npm i @paulgg-code/onchain-metadata-musicNFT`
2. `import "@paulgg-code/onchain-metadata-musicNFT/contracts/OnChainNFTMusicMetadata.sol";`
3. `contract MusicNFT is OnChainMusicMetadata`
4. use the `musicTokenUri(tokenId)` method freely.

### Example Music NFT:

```
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import "@paulgg-code/onchain-metadata-musicNFT/contracts/MusicSample/MusicTokenSample.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MusicNFT is ERC721, MusicTokenSample {
    uint256 songId;

    constructor() ERC721("Revolution Digital Music", "RDM") {
        songId = 0;
        setupSongMetadata();
        setupProjectMetadata();
    }

    function mint() public {
        songId++;
        _mint(msg.sender, songId);
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        virtual
        override(ERC721)
        returns (string memory)
    {
        require(_exists(_tokenId), "tokenId doesn't exist");
        return musicTokenUri(_tokenId);
    }
}
```

