//
//  MuralView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI

struct LocationListView: View {
    @ObservedObject var locations: Locations
    //list of our locations in a condensed form
    var body: some View {
        NavigationView {
            List(locations.murals){ mural in
                //link to a more detailed location view
                NavigationLink(destination: DetailLocationView(mural: mural)) {
                    //title image of the location
                    Image(mural.muralPicture)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    //location name and address
                    VStack(alignment: .leading) {
                        Text(mural.muralName)
                            .font(.headline)
                        Text(mural.address)
                    }
                }
            }
            .navigationTitle("ECAH - Murals")
        }
    }
}

struct MuralListView_Previews: PreviewProvider {
    static var previews: some View {
        MuralListView(locations: Locations())
    }
}
