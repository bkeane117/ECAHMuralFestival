//
//  MuralMapView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI
import MapKit

struct MuralMapView: View {
    @ObservedObject var murals: Murals
    
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var selectedPlace: MKPointAnnotation?
    
    @State private var showingPlaceDetails = false
    @State private var showingEditScreen = false
    
    //@State private var locations = [MKPointAnnotation]()

    var body: some View {
        let locationsList = murals.loadLocations()
        MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locationsList)
            .edgesIgnoringSafeArea(.all)
    }
    /*
    func loadLocations() -> [MKPointAnnotation]{
        var tempLocations = [MKPointAnnotation]()
        for mural in murals.murals {
            let annotation = MKPointAnnotation()
            annotation.title = mural.muralName
            print(mural.muralName)
            annotation.subtitle = mural.address
            annotation.coordinate = CLLocationCoordinate2D(latitude: mural.latitude, longitude: mural.longitude)
            tempLocations.append(annotation)
        }
        return tempLocations
    }
    */
}

struct MuralMapView_Previews: PreviewProvider {
    static var previews: some View {
        MuralMapView(murals: Murals())
    }
}
