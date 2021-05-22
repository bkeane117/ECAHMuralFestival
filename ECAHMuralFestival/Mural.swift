//
//  Mural.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import Foundation


struct Mural: Codable, Identifiable {
    struct Artist: Codable {
        let name: String
        let artistBio: String
    }
    
    let id: Int
    let muralName: String
    let address: String
    let audioFile: String
    let muralPicture: String
    let artists: [Artist]
    let description: String
    
    /*
    static func < (lhs: Mural, rhs: Mural) -> Bool {
        lhs.id < rhs.id
    }
    
    static func == (lhs: Mural, rhs: Mural) -> Bool {
        lhs.id == rhs.id
    }
    */
}
