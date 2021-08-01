//
//  Bundle-Decodable.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import Foundation

//decode our JSON data from our JSON file bundle
extension Bundle {
    func decode(_ file: String) -> [Location] {
        guard let url = self.url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode([Location].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
    /*
    func decode<T: Codable>(_ file: String) -> T {
        // decodes a string
        print(file)
        guard let url = self.url(forResource: file, withExtension: "json") else
         {
            
            fatalError("Failed to locate \(file) in bundle.")
            
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        // creates an instance of a JSON decoder
        let decoder = JSONDecoder()
        //creates an instance of a date formatter
        let formatter = DateFormatter()
        //sets format
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        //tries to decode the data that has been obtained
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            print(data)
            fatalError("Failed to decode \(file) from bundle.")
        }
        return loaded
    }
 */

