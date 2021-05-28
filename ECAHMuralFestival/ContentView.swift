//
//  ContentView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-20.
//

import SwiftUI
// Initial loading screen, as well as a display for ECAH branding
struct ContentView: View {
    //initialising our list of murals
    @ObservedObject var murals = Murals()
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    //Navigation to the homepage, tab view
                    NavigationLink(destination: HomePageView(murals: murals)){
                        Text("ECAH")
                            .padding()
                            .foregroundColor(.yellow)
                            .scaledToFill()
                            .font(.title)
                            .frame(maxHeight: .infinity, alignment: .center)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
