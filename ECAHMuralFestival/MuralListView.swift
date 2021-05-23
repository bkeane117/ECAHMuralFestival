//
//  MuralView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI

struct MuralListView: View {
    @ObservedObject var murals: Murals
    //list of our murals in a condensed form
    var body: some View {
        List(murals.murals){ mural in
            //link to a more detailed mural view
            NavigationLink(destination: DetailMuralView(mural: mural)) {
                //title image of the mural
                Image(mural.muralPicture)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                //mural name and address
                VStack(alignment: .leading) {
                    Text(mural.muralName)
                        .font(.headline)
                    Text(mural.address)
                }
            }
        }
    }
}

struct MuralListView_Previews: PreviewProvider {
    static var previews: some View {
        MuralListView(murals: Murals())
    }
}
