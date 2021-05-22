//
//  ECAHWebView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI
// navigate to the ECAH website
struct ECAHWebView: View {
    @Environment(\.openURL) var openURL

    var body: some View {
        Button("Visit ECAH") {
            openURL(URL(string: "https://www.ecah.ca/")!)
        }
    }
}

struct ECAHWebView_Previews: PreviewProvider {
    static var previews: some View {
        ECAHWebView()
    }
}
