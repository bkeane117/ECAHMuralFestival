//
//  DetailMuralView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI

struct DetailMuralView: View {
    let mural: Mural
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ZStack(alignment: .bottomTrailing){
                        Image(self.mural.muralPicture)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geometry.size.width)
                        Text(self.mural.muralName)
                            .font(.caption)
                            .fontWeight(.black)
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.75))
                            .clipShape(Capsule())
                            .offset(x: -5, y: -5)
                    }
                    NavigationLink(destination: Text("This is going to link murals location on the map")) {
                        Text(self.mural.address)
                            .font(.title)
                            .foregroundColor(.secondary)
                    }
                    
                    Text("About The Artists")
                        .font(.title2)
                    Group {
                        ForEach(self.mural.artists, id: \.name) { artist in
                            NavigationLink(destination: Text("This will link to a detailed artist view")){
                                HStack {
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .frame(width: 83, height: 60)
                                        .clipShape(Capsule())
                                        .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                    VStack(alignment: .leading){
                                        Text(artist.name)
                                            .font(.title3)
                                            .foregroundColor(.secondary)
                                        //Text(artist.artistBio)
                                    }
                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                    Text("What does the artist have to say?")
                        .font(.title2)
                        .padding()
                    
                    Text("AudioFile place holder - \(self.mural.audioFile)")
                        .padding()
                    
                    Text("About the site")
                        .font(.title2)
                        .padding()
                    Text(self.mural.description)
                        .padding()
                }
            }
        }
    }
}

struct DetailMuralView_Previews: PreviewProvider {
    static let mural = Mural(id: 1, muralName: "muralName", address: "someAddress", audioFile: "someAudioFile", muralPicture: "123FakeSt", artists: [Mural.Artist(name: "ArtistName", artistBio: "artistBio")], description: "description")
    static var previews: some View {
        DetailMuralView(mural: mural)
    }
}
