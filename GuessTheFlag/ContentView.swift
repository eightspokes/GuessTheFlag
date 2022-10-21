//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Roman on 10/20/22.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria","Poland","Russia","Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State var showingScore = false
    @State var title = ""
    @State var correctGuesses = 0
    @State var totalGuesses = 0
    
    func buttonPressed(num: Int){
        totalGuesses += 1
        if num == correctAnswer{
            correctGuesses += 1
        }
        showingScore = true
    }
    
    var body: some View {
        ZStack{
            RadialGradient(colors: [.indigo,.black], center: .center, startRadius:0, endRadius: 1000)
            VStack(spacing: 30){
                VStack(spacing:10){
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                        .font(.system(size: 22, weight: .semibold, design: .serif))
                        .italic()
                    Section{
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .light, design: .serif))
                            .italic()
                    }
                }
                ForEach(0..<3){ number in
                    //flag was tapped
                    Button{
                        buttonPressed(num: number)
                        correctAnswer = Int.random(in: 0...2)
                        countries.shuffle()
                        
                    }label:{
                        Image(countries[number])
                            .renderingMode(.original)
                        
                    }
                }
            }
        }.ignoresSafeArea()
            .alert("Your score is:  ", isPresented: $showingScore ) {
                Button("OK", role: .cancel) { }
            }message: {
                Text("\(correctGuesses)")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
