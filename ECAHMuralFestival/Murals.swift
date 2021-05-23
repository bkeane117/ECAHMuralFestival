//
//  Murals.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import Foundation
import SwiftUI
import MapKit

// this is our observable class to store our array of murals
class Murals: ObservableObject {
    //this insures that if we make a change in our Mural array, we save this change in our documents array, so that we can access them offline
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
        //initialise our class
        // #FINISH# so far, we are loading our array from our local bundle, but when live, this should load remotely from our database
        var tempMural: [Mural] = Bundle.main.decode("Mural")
        
        //#FINISH# right now just loads from DocDirectory if our bundle load fails, however, when finished, the logic should check to see if there is s difference between the database array and the stored array, load from stored array by default, and only remote load if there are differences present
        if tempMural.isEmpty {
            tempMural = self.loadFromDocumentsDirectory()
            self.murals = tempMural
            print("Loaded from Documents directory")
            return
        }
        self.murals = tempMural
    }
    //function to get data from our document directory and return in mural array format
    func loadFromDocumentsDirectory() -> [Mural] {
        let filename = self.getDocumentsDirectory().appendingPathComponent("SavedMurals")

        if let data = try? Data(contentsOf: filename) {
            if let jsonMurals = try? JSONDecoder().decode([Mural].self, from: data) {
                return jsonMurals
            }
        }
        return []
    }
    //get the path of our document directory
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    //load our JSON data(currently not used)
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
    //parse data
    func parse(json: Data) -> [Mural]? {
        let decoder = JSONDecoder()
        
        if let jsonMurals = try? decoder.decode([Mural].self, from: json) {
            return jsonMurals
            
        }
        return nil
        
    }
    func loadLocations() -> [MKPointAnnotation]{
        var tempLocations = [MKPointAnnotation]()
        for mural in murals {
            let annotation = MKPointAnnotation()
            annotation.title = mural.muralName
            print(mural.muralName)
            annotation.subtitle = mural.address
            annotation.coordinate = CLLocationCoordinate2D(latitude: mural.latitude, longitude: mural.longitude)
            tempLocations.append(annotation)
        }
        return tempLocations
    }
}
