//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Anthony Cifre on 1/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showAlert = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var numberOfTurns = 0
    
    
    @State private var countries = ["Estonia", "US", "Spain", "Ireland", "France", "Russia", "Italy", "UK", "Nigeria", "Monaco", "Germany", "Poland"]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var countryToGuess: String? {
        return countries.randomElement() ?? "US"
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    VStack {
                        Text("Tap the flag of")
                            .foregroundColor(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                        
                        
                        
                        
                    }
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                    
                }
                .ignoresSafeArea()
                .navigationTitle("GuessTheFlag")
                .alert("\(scoreTitle)", isPresented: $showAlert) {
                    Button(numberOfTurns < 5 ? "Continue" : "Reset Game", action: numberOfTurns < 5 ? askQuestion : resetGame)
                } message: {
                    
                    if numberOfTurns < 5 {
                        Text("Your score is \(score).\n\(score) / \(numberOfTurns) correct!")
                    } else {
                        Text("Game Over\nYou got \(score) / \(numberOfTurns) correct!")
                    }
                    
                }
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "Wrong"
        if number == correctAnswer {
            score += 1
        }
        
        numberOfTurns += 1
        showAlert = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        askQuestion()
        numberOfTurns = 0
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
