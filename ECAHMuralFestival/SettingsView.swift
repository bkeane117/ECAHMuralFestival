//
//  SettingsView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Display"), footer: Text("System settings will override Dark Mode and use the current device theme")) {
                    
                    Toggle(isOn: .constant(true), label: {
                        Text("Dark Mode")
                    })
                    
                    Toggle(isOn: .constant(true), label: {
                        Text("Use System Settings")
                    })
                }
                Section {
                    Label("Follow us on twitter @ECAH", systemImage: "link")
                }
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .semibold))
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
