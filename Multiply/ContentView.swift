//
//  ContentView.swift
//  Multiply
//
//  Created by Miguel Quezada on 23-05-22.
//

import SwiftUI


struct ContentView: View {
    
    @State var tableNumber = 10
    @State var nQuestions = [5, 10, 20]
    @State var currentNQuestions = 5
    @State var answer = 0
    @State var multiplier = Int.random(in: 1...12)
    @State var score = 0
    @State var isCorrect = false
    @State var scoreTitle = ""
    @State var isFocused = false
    @State var question = 1
    @State var isfinished = false
    
    
    
    
    
    
    var body: some View {
        Section{
            Form{
                VStack{
                    Text("Multiply").font(.largeTitle)
                    Text("Question number: \(question)")
                    Stepper("Choose the table :  \(tableNumber)", value: $tableNumber, in: 2...12, step: 1)
                    
                    Text("Choose the Number of Questions")
                    Picker("Choose the Number of Questions", selection: $currentNQuestions){
                        ForEach(nQuestions, id: \.self) {
                            Text($0, format: .number)
                        }
                        
                    }.pickerStyle(.segmented)
                    Spacer()
                    Section {
                       
                            HStack {
                                Text("\(tableNumber) * \(multiplier) is equals to: ")
                                
                                TextField("Enter your answer :", value: $answer, format: .number).keyboardType(.decimalPad)
                            }
                        }
                    
                    
                        
                    }
                    
                    
                    }
            Button("Next Question"){
                isCorrect = true
                checkQuestion()
            }
            
        }.alert("Game over!", isPresented: $isfinished) {
            Button("Start Again", action: nextQuestion)
        } message: {
            Text("Your final score was \(score)")
        }
        .alert(scoreTitle, isPresented: $isCorrect) {
            Button("Continue", action: nextQuestion)
        } message: {
            Text("Your score is \(score)")
    }
    
}
    func nextQuestion(){
        
        multiplier = Int.random(in: 1...12)
        question += 1
        if question > currentNQuestions{
            isfinished = true
            question = 0
        }
        
        
    }
    func checkQuestion(){
        if tableNumber * multiplier == answer {
            score += 1
            scoreTitle = "Correct!"
        }else {
            scoreTitle = "Wrong!"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
