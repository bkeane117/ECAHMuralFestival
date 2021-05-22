//
//  Murals.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import Foundation
import SwiftUI

class Murals: ObservableObject {
    @Published var murals = [Mural]() {
        didSet {
            do {
                let filename = self.getDocumentsDirectory().appendingPathComponent("SavedMurals")
                let data = try JSONEncoder().encode(self.murals)
                try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("unable to save data")
            }
        }
    }
    
    init() {
        var tempMural: [Mural] = Bundle.main.decode("Mural")
    
        if tempMural.isEmpty {
            tempMural = self.loadFromDocumentsDirectory()
            self.murals = tempMural
            print("Loaded from Documents directory")
            return
        }
        self.murals = tempMural
    }
    func loadFromDocumentsDirectory() -> [Mural] {
        let filename = self.getDocumentsDirectory().appendingPathComponent("SavedMurals")

        if let data = try? Data(contentsOf: filename) {
            if let jsonMurals = try? JSONDecoder().decode([Mural].self, from: data) {
                return jsonMurals
            }
        }
        return []
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadJSONData() -> [Mural]? {
        
        let urlString = "Mural.JSON"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // parse data
                return parse(json: data)
            }
        }
        return nil
    }
    
    func parse(json: Data) -> [Mural]? {
        let decoder = JSONDecoder()
        
        if let jsonMurals = try? decoder.decode([Mural].self, from: json) {
            return jsonMurals
            
        }
        return nil
        
    }
}
