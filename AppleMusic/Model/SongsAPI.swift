//
//  SongsAPI.swift
//  Artists
//
//  Created by aidin ahmadian on 10/13/19.
//  Copyright © 2019 aidin ahmadian. All rights reserved.
//  https://github.com/aidinahmadian

import Foundation

class SongsAPI {
    static func getLists() -> [Songs]{
        let songsList = [
            Songs(name: "Interstellar", artistName: "Hans Zimmer", songName: "Day One"),
            Songs(name: "Castles", artistName: "Freya Ridings", songName: "Castles"),
            Songs(name: "Castle on the hill", artistName: "Ed Sheeran", songName: "Castle on the hill"),
            Songs(name: "Let it go", artistName: "James Bay", songName: "Let it go"),
            Songs(name: "Strong", artistName: "London Grammer", songName: "Strong"),
            Songs(name: "Another love", artistName: "Tom Odell", songName: "Another love"),
            Songs(name: "Shape of my heart", artistName: "Sting", songName: "Shape of my heart"),
            Songs(name: "musicLogo", artistName: "Unknown", songName: "Unknown"),
        ]
        return songsList
    }
}
