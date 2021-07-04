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
    //@State private var centerCoordinate = CLLocationCoordinate2D(latitude: 48.437042, longitude: -123.405634)
    @State private var selectedPlace: MKPointAnnotation?
    
    @State private var currentLocation = CLLocationCoordinate2D()
    
    @State private var showingPlaceDetails = false
    @State private var showingEditScreen = false
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.437042, longitude: -123.405634), span: MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04))
    var locationFetcher = LocationFetcher()
    
    @State private var tappedTitle = ""
    @State private var tappedSubtitle = ""
    
    //@State private var locations = [MKPointAnnotation]()
    // #NEEDS WORK - need to find a way to navigate from here to our detailed view

    var body: some View {
        let locationsList = murals.loadLocations()
        ZStack{
            Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: locationsList, annotationContent: { location in
                MapAnnotation(coordinate: location.coordinate) {
                    ZStack {
                        //MapPinView()
                        Button(action: {
                            showingPlaceDetails.toggle()
                            tappedTitle = location.title ?? ""
                            tappedSubtitle = location.subtitle ?? ""
                        }) {
                        Image(systemName: "mappin")
                            .padding()
                            .foregroundColor(.red)
                            .font(.title)
                        }
                    }
                }
                //MapPin(coordinate: $0.coordinate)
            })
            .edgesIgnoringSafeArea(.all)
                
        }/*{
                MapAnnotation(coordinate: $0.coordinate) {
                    ZStack {
                        //MapPinView()
                        Button(action: {
                            showingPlaceDetails.toggle()
                            //tappedLocation = $0.title
                        }) {
                        Image(systemName: "mappin")
                            .padding()
                            .foregroundColor(.red)
                            .font(.title)

                        }
                    }
                }
                //MapPin(coordinate: $0.coordinate)
            } */
        .alert(isPresented: $showingPlaceDetails) {
            Alert(title: Text(tappedTitle), message: Text(tappedSubtitle), primaryButton: .cancel(),
                secondaryButton: .default(Text("Learn More")) {
                    print("This will go to our detailed mural view")
                }
            )
        }
            /*
            MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails, currentLocation: $currentLocation, annotations: locationsList)
                .edgesIgnoringSafeArea(.all)
 */
            /*
    // this is some test code in ordr to test location data
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        centerCoordinate = self.locationFetcher.lastKnownLocation ?? locationsList[0].coordinate
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
                */
                /*
        }
        .onAppear() {
            self.locationFetcher.start()
        }
 */
    }
        
}

struct MuralMapView_Previews: PreviewProvider {
    static var previews: some View {
        MuralMapView(murals: Murals())
    }
}
