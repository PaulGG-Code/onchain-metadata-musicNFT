// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "../OnChainNFTMusicMetadata.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MusicTokenSample is OnChainMusicMetadata {
    function setupSongMetadata() internal {
        string memory title = "NFT Music Revolution NFT";
        string
            memory description = "An onchain music NFT with data on-chain metadatda encoded with Base64.";
        string memory artist = "lolplz";
        string
            memory audioUri = "ipfs://bafybeia5cj4kbqxoemui2ys2rdbchu3qm4wc2intezxbebptnxznmp5pbu";
        string memory audioMimetype = "audio/mpeg";
        string memory license = "France Production Plus Plus";
        string memory genre = "Rock";
        string memory location = "France, Paris";
        string
            memory externalUrl = "https://www.npmjs.com/package/@paulgg-code/onchain-metadata-musicNFT";

        Image memory image = getImage();
        PublishingData memory songPublishingData = PublishingData(
            title,
            description,
            "lolplz Record Label",
            "lolplz Publishing",
            location,
            "04-02-2023"
        );

        AudioQuantitative memory audioQuantitative = AudioQuantitative(
            "C",
            105,
            420,
            audioMimetype,
            1
        );
        AudioQualitative memory audioQualitative = AudioQualitative(
            license,
            externalUrl,
            "CC-XXX-YY-NNNNN",
            genre
        );

        SongDetails memory songDetails = SongDetails(
            artist,
            audioQuantitative,
            audioQualitative
        );

        Lyrics memory lyrics = Lyrics("Music Lyrics", "Music Lyrics NFT Location");
        Audio memory song = Audio(audioUri, songDetails, lyrics);

        SongContent memory songContent = SongContent(song, image);

        songs[1].song = songContent;
        songs[1].songPublishingData = songPublishingData;
        credits[1].push(Collaborator("lolplz", "creator"));
        credits[1].push(Collaborator("nix", "music maker"));
        tags[1].push("lolplz");
        tags[1].push("france-production-plus-plus");
        tags[1].push("linkin park");
    }

    function setupProjectMetadata() internal {
        PublishingData memory publishingData = PublishingData(
            "In the End",
            "Revolutionary OnChain Metadata in Music NFT",
            "Lolplz Record Label",
            "Lolplz Publishing",
            "France, Paros",
            "04-02-2023"
        );

        _projectMetadata = ProjectMetadata(
            publishingData,
            getImage(),
            "Single",
            "1676146223"
        );
    }

    function getImage() public pure returns (Image memory) {
        string
            memory artworkUri = "ipfs://bafybeig4nj5ch6wdh2jq6m5zs3fmeqqvvtu7etkrlzsm3own6mu2kq7yju";
        string memory artworkMimeType = "image/png";
        return Image(artworkUri, artworkMimeType, "An NFT for Music");
    }
}
