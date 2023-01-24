//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Anthony Cifre on 1/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    
    
    var countries = ["Estonia", "US", "Spain", "Ireland", "France", "Russia", "Italy", "UK", "Nigeria", "Monaco", "Germany", "Poland"]
    var correctAnswer = Int.random(in: 0...2)
    
    var countryToGuess: String? {
        return countries.randomElement() ?? "US"
    }
    
    var body: some View {
        NavigationView {

            
                ZStack {
                    VStack(spacing: 0) {
                        Color.red
                        Color.blue
                    }

                    VStack {
                        Text("What flag is for")
                            .foregroundColor(.secondary)
                            .padding(10)
                            .background(.ultraThinMaterial)
                        Text("United States")
                            .foregroundColor(.secondary)
                            .padding(10)
                            .background(.ultraThinMaterial)
                        Button {
                            // some action
                        } label: {
                            Image("France")
                        }
                        Button {
                            // some action
                        } label: {
                            Image("Italy")
                        }
                        Button {
                            // some action
                        } label: {
                            Image("US")
                        }

                    }
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
