//
//  MuralMapView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI
import MapKit

struct MuralMapView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var selectedPlace: MKPointAnnotation?
    
    @State private var showingPlaceDetails = false
    @State private var showingEditScreen = false
    
    @State private var locations = [MKPointAnnotation]()
    
    var body: some View {
        MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locations)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MuralMapView_Previews: PreviewProvider {
    static var previews: some View {
        MuralMapView()
    }
}
