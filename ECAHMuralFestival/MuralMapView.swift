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
    // #NEEDS WORK - need to find a way to navigate from here to our detailed view

    var body: some View {
        let locationsList = murals.loadLocations()
        MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locationsList)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MuralMapView_Previews: PreviewProvider {
    static var previews: some View {
        MuralMapView(murals: Murals())
    }
}
