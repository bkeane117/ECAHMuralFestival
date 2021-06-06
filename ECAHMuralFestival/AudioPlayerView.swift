//
//  audioPlayerView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-27.
//

import SwiftUI
import AVFoundation

//custom view for an audio player
struct AudioPlayerView: View {
    @State private var audioPlayer: AVAudioPlayer!
    let audioFile: String
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.audioPlayer.play()
            }) {
                Image(systemName: "play.circle.fill")
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
        }
            Spacer()
            Button(action: {
                self.audioPlayer.pause()
            }) {
                Image(systemName: "pause.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
        }
        .onAppear {
            //let data = NSDataAsset(name: "sound")!
            var filePath: String?
            filePath = Bundle.main.path(forResource: audioFile, ofType: "mp3")     // For you should be siren  and mp3
            let fileURL = URL(fileURLWithPath: filePath!)
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: fileURL)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct AudioPlayerView_Previews: PreviewProvider {
    static let audioFile = "michael-dam"
    static var previews: some View {
        AudioPlayerView(audioFile: audioFile)
    }
}
