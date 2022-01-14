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
        let percentage = 100*Double(numCorrect)/Double(numQuestions)
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
            Text("Results")
            Text(response)
            Text("You scored \(numCorrect) out of \(numQuestions)")
            
            Button {
                model.moduleSelector = nil
            } label: {
                Text("Complete")
            }
        }
    }
}

struct QuizResultsView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultsView(numCorrect: 7, numQuestions: 10)
            .environmentObject(ContentModel())
    }
}
