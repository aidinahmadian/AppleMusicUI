//
//  ArtistsAPI.swift
//  Artists
//
//  Created by aidin ahmadian on 10/13/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import Foundation

class ArtistsAPI {
    static func getLists() -> [Artists]{
        let artistsList = [
            Artists(name: "Tom Odell", style: "Indie Pop", country: "England"),
            Artists(name: "Freya Ridings", style: "Pop / Soul", country: "England"),
            Artists(name: "Ed Sheeran", style: "Contemporary folk / Pop", country: "England"),
            Artists(name: "James Bay", style: "Rock / Pop", country: "England"),
            Artists(name: "Hans Zimmer", style: "Score Composer", country: "Germany"),
            Artists(name: "Leonard Cohen", style: "Folk / Soft Rock", country: "Canada"),
            Artists(name: "Sting", style: "Pop / Rock / Jazz", country: "England"),
            Artists(name: "London Grammer", style: "Indie Pop", country: "England"),
            //Artists(name: "Leonard Cohen", style: "Pop", country: "Canada"),
        ]
        return artistsList
    }
}
