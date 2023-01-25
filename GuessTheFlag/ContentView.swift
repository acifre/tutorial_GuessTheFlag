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
    @State private var alertMessage = ""
    @State private var score = 0
    @State private var numberOfTurns = 0
    @State private var countries = ["Estonia", "US", "Spain", "Ireland", "France", "Russia", "Italy", "UK", "Nigeria", "Monaco", "Germany", "Poland"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    let correctMessages = ["Great job!", "You're a pro!", "You know your stuff...", "Keep it up!"]
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                RadialGradient(stops: [
                    .init(
                        color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Text("Guess the Flag")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white)
                    Spacer()
                    VStack(spacing: 15) {
                        
                        VStack {
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            
                            Text(countries[correctAnswer])
                                .foregroundColor(.white)
                                .font(.largeTitle.weight(.semibold))
                            
                        }
                        
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                FlagImage(imageName: countries[number])

                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Spacer()
                    Spacer()
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    Spacer()
                    
                    
                }
                .padding()
                .alert("\(scoreTitle)", isPresented: $showAlert) {
                    Button(numberOfTurns < 8 ? "Continue" : "Reset Game", action: numberOfTurns < 8 ? askQuestion : resetGame)
                } message: {
                    
                    if numberOfTurns < 8 {
                        Text("\n\(alertMessage)\n\n\(score) / \(numberOfTurns) correct")
                    } else {
                        Text("\nGame Over\n\nYou got \(score) / \(numberOfTurns) correct!")
                    }
                    
                }
                
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "Wrong"
        alertMessage = number == correctAnswer ? correctMessages.randomElement()! : "That's the flag of \(countries[number])."
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

struct FlagImage: View {
    var imageName: String
    
    var body: some View {
        
        Image(imageName)
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(radius: 5)
        
    }
    
    
}
