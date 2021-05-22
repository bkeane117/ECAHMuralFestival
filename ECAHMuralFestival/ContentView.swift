//
//  ContentView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var murals = Murals()
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                NavigationLink(destination: HomePageView(murals: murals)){
                    Text("ECAH")
                        .padding()
                        .foregroundColor(.yellow)
                        .scaledToFill()
                        .font(.title)
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
