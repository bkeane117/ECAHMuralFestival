//
//  HeaderView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-27.
//

import SwiftUI

struct HeaderView: View {
    //let mural: Mural
    let picture: String
    let title: String
    var body: some View {

        //VStack {
            ZStack(alignment: .bottomTrailing){
                Image(picture)
                    .resizable()
                    .scaledToFit()
                    //.frame(maxWidth: geometry.size.width)
                Text(title)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)

           // }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static let picture = "500AdmiralsRd"
    static let title = "Esquimalt United Church"
    static var previews: some View {
        HeaderView(picture: picture, title: title)
    }
}
