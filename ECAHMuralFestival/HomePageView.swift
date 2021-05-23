//
//  TabView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-20.
//

import SwiftUI

struct HomePageView: View {
    //Home page to navigate to different pages
    @ObservedObject var murals: Murals
    var body: some View {
        TabView{
            //Map of mural locations
            MuralMapView(murals: murals)
                .tabItem {
                    Image(systemName: "map")
                }
            //list of murals in the festival
            MuralListView(murals: murals)
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                }
            //link to the ECAH home page
            ECAHWebView()
                .tabItem {
                    Image(systemName: "network")
                }
            //page for settings etc.
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                }
        }
        .navigationBarTitle("ECAH")
        .navigationBarBackButtonHidden(true)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(murals: Murals())
    }
}
