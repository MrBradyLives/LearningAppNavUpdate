//
//  QuizView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 14.1.2022.
//

import SwiftUI

struct QuizView: View {
    
    @EnvironmentObject var model: ContentModel
    var moduleId: Int
    @State var questionId = 0
    
    var body: some View {
        
        let htmlString = model.addCodeStyling(model.modules[moduleId].test.questions[questionId].content)
        
        
        VStack {
            Text("Question: \(questionId+1)")
                .font(.largeTitle)
                .padding()
            Text("Question ID: \(questionId)")
            Text("Count-1: \(model.modules[moduleId].test.questions.count-1)")
            
            CodeTextView(htmlTextStringToInsert: htmlString)
            
            Button {
                if questionId == model.modules[moduleId].test.questions.count-1 {
                    model.moduleSelector = nil
                }
                else {
                    questionId += 1
                }
            } label: {
                if questionId >= model.modules[moduleId].test.questions.count-2 {
                    ZStack {
                        RectangleView(color: .red, height: 50)
                        Text("Complete - Return Home")
                            .foregroundColor(.white)
                    }
                }
                else {
                    ZStack {
                        RectangleView(color: .green, height: 50)
                        Text("Next Question")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(moduleId: 0)
            .environmentObject(ContentModel())
    }
}
