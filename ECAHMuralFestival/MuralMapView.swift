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
    
    var locationFetcher = LocationFetcher()
    
    //@State private var locations = [MKPointAnnotation]()
    // #NEEDS WORK - need to find a way to navigate from here to our detailed view

    var body: some View {
        let locationsList = murals.loadLocations()
        ZStack{
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, annotations: locationsList)
                .edgesIgnoringSafeArea(.all)
    // this is some test code in ordr to test location data
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // create a new location
                        if let location = self.locationFetcher.lastKnownLocation {
                            print("Your location is \(location)")
                        } else {
                            print("Your location is unknown")
                        }
                    }) {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.black.opacity(0.75))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                    }
                }
            }
        }
        .onAppear() {
            self.locationFetcher.start()
        }
    }
}

struct MuralMapView_Previews: PreviewProvider {
    static var previews: some View {
        MuralMapView(murals: Murals())
    }
}
