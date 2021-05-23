//
//  Artist.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-23.
//

import Foundation

// data structure to receive our Artist JSON data
struct Artist: Codable {
    let name: String
    let artistBio: String
}
