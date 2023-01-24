//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Anthony Cifre on 1/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {

            
                ZStack {
                    VStack(spacing: 0) {
                        Color.red
                        Color.blue
                    }

                    Text("Your content")
                        .foregroundColor(.secondary)
                        .padding(50)
                        .background(.ultraThinMaterial)
                }
                .ignoresSafeArea()
                .navigationTitle("GuessTheFlag")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
