//
//  AlbumArtworksAPI.swift
//  Artists
//
//  Created by aidin ahmadian on 10/14/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import Foundation

class ArtworksAPI {

    static func getLists() -> [Artworks]{
        let artistsList = [
            Artworks(albumImages: "Interstellar", names: "Hans Zimmer"),
            Artworks(albumImages: "Castles", names: "Freya Ridings"),
            Artworks(albumImages: "Castle on the hill", names: "Ed Sheeran"),
            Artworks(albumImages: "Let it go", names: "James Bay"),
            Artworks(albumImages: "You want it darker", names: "Leonard Cohen"),
            Artworks(albumImages: "Strong", names: "London Grammer"),
            Artworks(albumImages: "Another love", names: "Tom Odell"),
            Artworks(albumImages: "Shape of my heart", names: "Sting"),
        ]
        return artistsList
    }
}
