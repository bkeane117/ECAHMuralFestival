//
//  ContentView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-20.
//

import SwiftUI
struct ContentView: View {
    //Home page to navigate to different pages
    @ObservedObject var locations: Locations
    var body: some View {
        TabView{
            //list of locations in the festival
            LocationListView(isLoading: false, locations: locations)
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                }
            //Map of location locations
            LocationMapView(locations: locations)
                .tabItem {
                    Image(systemName: "map")
                }
            //link to the ECAH home page
            ECAHWebView()
                .tabItem {
                    Image(systemName: "network")
                }
            //page for settings etc.
//            SettingsView()
//                .tabItem {
//                    Image(systemName: "gearshape")
//                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(locations: Locations())
    }
}
