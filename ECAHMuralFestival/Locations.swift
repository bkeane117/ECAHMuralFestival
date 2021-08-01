//
//  Locations.swift
//  ECAHLocationFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import Foundation
import SwiftUI
import MapKit

enum ResultState: Equatable {
    case loading
    case failed(error: Error)
    case success
//    case success(content: [Location])
    
    static func == (lhs: ResultState, rhs: ResultState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.failed(error: let lhsType), .failed(error: let rhsType)):
            return lhsType.localizedDescription == rhsType.localizedDescription
//        case (.success(content: let lhsType), .success(content: let rhsType)):
        case (.success, .success):
            return true
        default:
            return false
        }
    }
}

// this is our observable class to store our array of locations
class Locations: ObservableObject, Identifiable {
    //this insures that if we make a change in our Location array, we save this change in our documents array, so that we can access them offline
    @Published private(set) var state: ResultState = .loading
    var isLoading: Bool {
        state == .loading
    }
    @Published var locations = [Location]() {
        didSet {
            do {
                let filename = self.getDocumentsDirectory().appendingPathComponent("SavedLocations")
                let data = try JSONEncoder().encode(self.locations)
                try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("unable to save data")
            }
        }
    }
    
    init() {
        //initialise our class
        // #FINISH# so far, we are loading our array from our local bundle, but when live, this should load remotely from our database
        //var tempLocation: [Location] = Bundle.main.decode("Location")
        var tempLocation: [Location] = Bundle.main.decode("Location2")
        
        //#FINISH# right now just loads from DocDirectory if our bundle load fails, however, when finished, the logic should check to see if there is s difference between the database array and the stored array, load from stored array by default, and only remote load if there are differences present
        if tempLocation.isEmpty {
            tempLocation = self.loadFromDocumentsDirectory()
            self.locations = tempLocation
            print("Loaded from Documents directory")
            return
        }
        self.locations = tempLocation
        self.state = .success
    }
    //function to get data from our document directory and return in location array format
    func loadFromDocumentsDirectory() -> [Location] {
        let filename = self.getDocumentsDirectory().appendingPathComponent("SavedLocations")

        if let data = try? Data(contentsOf: filename) {
            if let jsonLocations = try? JSONDecoder().decode([Location].self, from: data) {
                return jsonLocations
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
    func loadJSONData() -> [Location]? {
        let urlString = "Location.JSON"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // parse data
                return parse(json: data)
            }
        }
        return nil
    }
    //parse data
    func parse(json: Data) -> [Location]? {
        let decoder = JSONDecoder()
        
        if let jsonLocations = try? decoder.decode([Location].self, from: json) {
            return jsonLocations
            
        }
        return nil

    }
    func loadLocations() -> [CodableMKPointAnnotation]{
        var tempLocations = [CodableMKPointAnnotation]()
        for location in locations {
            let annotation = CodableMKPointAnnotation()
            annotation.title = location.locationName
            //print(location.locationName)
            annotation.subtitle = location.address
            annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            tempLocations.append(annotation)
        }
        return tempLocations
    }
}
