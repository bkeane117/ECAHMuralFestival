//
//  DetailMuralView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI
import AVFoundation

struct DetailMuralView: View {
    //@State var isLoading: Bool
    //detail view of a specific mural
    let mural: Mural
    //@State private var audioPlayer: AVAudioPlayer!
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    //A header style display to displaye our murals
                    HeaderView(picture: self.mural.muralPicture, title: self.mural.muralName)

                    NavigationLink(destination: Text("This is going to link murals location on the map")) {
                        Text(self.mural.address)
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                    Text("About The Artists")
                        .font(.title2)
                        .foregroundColor(.primary)
                    //A list of artists that worked on the mural(split into a differnt view)
                    Group {
                        ForEach(self.mural.artists, id: \.name) { artist in
                            //This links to a detailed artist view
                            NavigationLink(destination: DetailArtistView(artist: artist)){
                                //This is our list of artists
                                ListView(picture: artist.artistPicture, name: artist.name)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                    Spacer()
                    Text("What does the artist have to say?")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding()
                    
                    //pass in an audio file for our audio player
                    AudioPlayerView(audioFile: mural.audioFile)
                    
                    Text("About the site")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding()
                    
                    Text(self.mural.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding()
                }
            }
        }
        .navigationBarTitle(Text(self.mural.address), displayMode: .inline)
        //.redacted(reason: .placeholder)
    }
}

struct DetailMuralView_Previews: PreviewProvider {
    static let mural = Mural(id: 1, muralName: "muralName", address: "someAddress", audioFile: "someAudioFile", muralPicture: "123FakeSt", artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")], description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619)
    static var previews: some View {
        DetailMuralView(mural: mural)
    }
}
