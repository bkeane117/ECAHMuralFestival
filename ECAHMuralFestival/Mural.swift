//
//  Mural.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import Foundation
import MapKit

//data structure to receive our Mural JSON data 
struct Mural: Codable, Identifiable, Comparable {
    
    let id: Int
    let muralName: String
    let address: String
    let audioFile: String
    let muralPicture: String
    let artists: [Artist]
    let description: String
    let latitude: Double
    let longitude: Double
    
    static func < (lhs: Mural, rhs: Mural) -> Bool {
        lhs.id < rhs.id
    }
    
    static func == (lhs: Mural, rhs: Mural) -> Bool {
        lhs.id == rhs.id
    }
}
