//
//  Mural.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import Foundation
import MapKit

//data structure to receive our Mural JSON data 
struct Location: Codable, Identifiable, Comparable, Equatable {
    
    let id: Int
    let locationName: String
    let address: String
    let audioFile: String
    let locationPicture: String
    let description: String
    let latitude: Double
    let longitude: Double
    let artists: [Artist]
    
    static func < (lhs: Location, rhs: Location) -> Bool {
        lhs.id < rhs.id
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

extension Location {
    static var dummyData: [Location] {
        [
            .init(id: 1, locationName: "ECAH", address: "ECAH", audioFile: "someAudioFile", locationPicture: "ECAH_default", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "ECAH", artistBio: "artistBio")]),
            .init(id: 1, locationName: "locationName", address: "someAddress", audioFile: "someAudioFile", locationPicture: "123FakeSt", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")]),
            .init(id: 1, locationName: "locationName", address: "someAddress", audioFile: "someAudioFile", locationPicture: "123FakeSt", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")]),
            .init(id: 1, locationName: "locationName", address: "someAddress", audioFile: "someAudioFile", locationPicture: "123FakeSt", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")]),
            .init(id: 1, locationName: "locationName", address: "someAddress", audioFile: "someAudioFile", locationPicture: "123FakeSt", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")]),
            .init(id: 1, locationName: "locationName", address: "someAddress", audioFile: "someAudioFile", locationPicture: "123FakeSt", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")]),
            .init(id: 1, locationName: "locationName", address: "someAddress", audioFile: "someAudioFile", locationPicture: "123FakeSt", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")]),
            .init(id: 1, locationName: "locationName", address: "someAddress", audioFile: "someAudioFile", locationPicture: "123FakeSt", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")]),
            .init(id: 1, locationName: "locationName", address: "someAddress", audioFile: "someAudioFile", locationPicture: "123FakeSt", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")]),
            .init(id: 1, locationName: "locationName", address: "someAddress", audioFile: "someAudioFile", locationPicture: "123FakeSt", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")])

        ]

    }
}
