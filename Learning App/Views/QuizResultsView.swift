//
//  QuizResultsView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 14.1.2022.
//

import SwiftUI

struct QuizResultsView: View {
    
    @EnvironmentObject var model: ContentModel
    var numCorrect: Int
    var numQuestions: Int
    
    var response:String {
        let percentage = 100*numCorrect/numQuestions
        if percentage >= 90 {
            return "Excellent!"
        }
        else if percentage >= 75 {
            return "Great Job!"
        }
        else if percentage >= 60 {
            return "Getting there!"
        }
        else {
            return "Time to get to work!"
        }
    }

    var body: some View {
        VStack {
            Spacer()
            
            Text(response)
                .font(.largeTitle)
                .padding()
            Text("You scored \(100*numCorrect/numQuestions)%")
            Text("That's \(numCorrect) out of \(numQuestions) correct")
            
            Spacer()
            
            Button {
                model.moduleSelector = nil
            } label: {
                ZStack {
                    RectangleView(color: .blue, height: 60)
                    Text("Complete - Return to Home")
                        .foregroundColor(.white)
                }
   
            }
        }
        .padding()
        .navigationTitle("Quiz Results")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct QuizResultsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultsView(numCorrect: 7, numQuestions: 10)
            .environmentObject(ContentModel())
    }
}
