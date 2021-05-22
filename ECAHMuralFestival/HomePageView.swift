//
//  TabView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-20.
//

import SwiftUI

struct HomePageView: View {
    @ObservedObject var murals: Murals
    var body: some View {
        TabView{
            MuralMapView()
                .tabItem {
                    Image(systemName: "map")
                }
            MuralListView(murals: murals)
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                }
            ECAHWebView()
                .tabItem {
                    Image(systemName: "network")
                }
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
