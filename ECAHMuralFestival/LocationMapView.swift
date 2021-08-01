//
//  LocationMapView.swift
//  ECAHLocationFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    @ObservedObject var locations: Locations
    
    @State private var centerCoordinate = CLLocationCoordinate2D()

    @State private var selectedPlace: MKPointAnnotation?
    
    @State private var currentLocation = CLLocationCoordinate2D()
    
    @State private var showingPlaceDetails = false
    @State private var showingEditScreen = false
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.437042, longitude: -123.405634), span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
    var locationFetcher = LocationFetcher()
    
    @State private var tempLocation = Location(id: 1, locationName: "locationName", address: "someAddress", audioFile: "someAudioFile", locationPicture: "123FakeSt", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")])
    
    @State private var tappedTitle = ""
    @State private var tappedSubtitle = ""
    @State private var showDetail = false
    
    var body: some View {
        let locationsList = locations.loadLocations()
        NavigationView {
            ZStack{
                Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: locationsList, annotationContent: { location in
                    MapAnnotation(coordinate: location.coordinate) {
                        ZStack {
                            //MapPinView()
                            Button(action: {
                                showingPlaceDetails.toggle()
                                tappedTitle = location.title ?? ""
                                tappedSubtitle = location.subtitle ?? ""
                                tempLocation = getLocation(locationName: tappedTitle)!
                            }) {
                            Image(systemName: "mappin")
                                .padding()
                                .foregroundColor(.red)
                                .font(.title)
                            }
                        }
                    }
                })
                .edgesIgnoringSafeArea(.all)
                    
            }
            // pressents a sheet displaying the location
            .sheet(isPresented: $showDetail) {
                NavigationView{
                    DetailLocationView(location: tempLocation)
                }
            }
            .alert(isPresented: $showingPlaceDetails) {
                Alert(title: Text(tappedTitle), message: Text(tappedSubtitle), primaryButton: .cancel(),
                    secondaryButton: .default(Text("Learn More")) {
                        showDetail.toggle()
                    }
                )
            }
        }
    }
    
    func getLocation(locationName: String) -> Location? {
        for location in self.locations.locations {
            if (locationName == location.locationName) {
                return location
            }
        }
        return nil
    }
}

struct LocationMapView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapView(locations: Locations())
    }
}
