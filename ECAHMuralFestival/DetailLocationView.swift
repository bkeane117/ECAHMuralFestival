//
//  DetaillocationView.swift
//  ECAHlocationFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI
import AVFoundation

struct DetailLocationView: View {
    //@State var isLoading: Bool
    //detail view of a specific location
    let location: Location
    //@State private var audioPlayer: AVAudioPlayer!
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    //A header style display to displaye our locations
                    HeaderView(picture: self.location.locationPicture, title: self.location.locationName)

                    Text(self.location.address)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Text("Who will you see?")
                        .font(.title2)
                        .foregroundColor(.primary)
                    //A list of artists that worked on the location(split into a differnt view)
                    Group {
                        ForEach(self.location.artists, id: \.name) { artist in
                            //This links to a detailed artist view
                            if artist.name != "" {
                                NavigationLink(destination: DetailArtistView(artist: artist)){
                                    //This is our list of artists
                                    ListView(picture: artist.artistPicture, name: artist.name)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    
                    Spacer()
//                    Text("What does the artist have to say?")
//                        .font(.title2)
//                        .foregroundColor(.primary)
//                        .padding()
                    
                    //pass in an audio file for our audio player
                    //AudioPlayerView(audioFile: location.audioFile)
                    if location.description != "" {
                        Text("About the site")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .padding()
                        
                        Text(self.location.description)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                }
            }
        }
        .navigationBarTitle(Text(self.location.address), displayMode: .inline)
        //.redacted(reason: .placeholder)
    }
}

struct DetailLocationView_Previews: PreviewProvider {
    static let location = Location(id: 1, locationName: "locationName", address: "someAddress", audioFile: "someAudioFile", locationPicture: "123FakeSt", description: "description", latitude: 48.43037503887334, longitude: -123.4121059752619, artists: [Artist(name: "ArtistName", artistPicture: "michael-dam", artistBio: "artistBio")])
    static var previews: some View {
        DetailLocationView(location: location)
    }
}
