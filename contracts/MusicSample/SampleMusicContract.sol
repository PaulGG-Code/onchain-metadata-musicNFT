// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import "@paulgg-code/onchain-metadata-musicNFT/contracts/MusicSample/MusicTokenSample.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MusicNFT is ERC721, MusicSample {
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