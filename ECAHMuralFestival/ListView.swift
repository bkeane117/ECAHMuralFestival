//
//  ListView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-27.
//

import SwiftUI

struct ListView: View {
    let picture: String
    let name: String
    //a custome view to list pictures and some detail text in a ForEach loop
    var body: some View {
        HStack {
            if picture != "" {
                Image(picture)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 83, height: 60)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
            } else {
                Image(Location.dummyData[0].locationPicture)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 83, height: 60)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                    //.redacted(reason: .placeholder)
            }
            VStack(alignment: .leading){
                Text(name)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ListView_Previews: PreviewProvider {
    static let picture = "michael-dam"
    static let name = "ArtistName"
    static var previews: some View {
        ListView(picture: picture, name: name)
    }
}
