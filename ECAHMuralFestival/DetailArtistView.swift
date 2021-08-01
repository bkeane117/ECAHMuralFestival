//
//  ArtistView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI

struct DetailArtistView: View {
    @Environment(\.openURL) var openURL
    let artist: Artist
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    //a header view for our artist title and picture
                    HeaderView(picture: artist.artistPicture, title: artist.name)
                    
                    if verifyURL(urlString: self.artist.artistBio) {
                        Button("Visit \(self.artist.name)") {
                            openURL(URL(string: self.artist.artistBio)!)

                        }
                    } else {
                        Text(self.artist.artistBio)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
            }
            .navigationBarTitle(Text(self.artist.name), displayMode: .inline)
        }
    }
    func verifyURL (urlString: String?) -> Bool {
       if let urlString = urlString {
           if let url = NSURL(string: urlString) {
               return UIApplication.shared.canOpenURL(url as URL)
           }
       }
       return false
   }
}

struct DetailArtistView_Previews: PreviewProvider {
    static var previews: some View {
        let artist = Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")
        DetailArtistView(artist: artist)
    }
}
