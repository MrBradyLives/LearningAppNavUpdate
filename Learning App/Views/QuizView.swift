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
    @State var resultsSelector = 0
    @State var answerIsSubmitted = false
    @State var selectedAnswerIndex: Int? = nil
    @State var showResuts = false
    @State var correctAnswers = 0
    
    var body: some View {
        
        let htmlString = model.addCodeStyling(model.modules[moduleId].test.questions[questionId].content)
        let currentQueston = model.modules[moduleId].test.questions[questionId]
        
        if resultsSelector == 0 {
            VStack {
                Text("Question: \(questionId+1)")
                    .font(.largeTitle)
                    .padding(.bottom)
                
                CodeTextView(htmlTextStringToInsert: htmlString)
                    .frame(height: 200)
                
                //Mark: Answers Stack
                ScrollView {
                    VStack {
                        ForEach(0...model.modules[moduleId].test.questions[questionId].answers.count-1, id: \.self) { index in
                            
                            Button {
                                selectedAnswerIndex = index
                            } label: {
                                
                                // Grey when pressed
                                if answerIsSubmitted == false {
                                    ZStack {
                                        RectangleView(color: index == selectedAnswerIndex ? Color(.systemOrange) : Color(.systemCyan), height: 60)
                                        Text(model.modules[moduleId].test.questions[questionId].answers[index])
                                            .foregroundColor(.white)
                                    }
                                }
                                // Button green if correct red if incorrect plus green for correct
                                else {
                                    if currentQueston.answers[index] == currentQueston.answers[currentQueston.correctIndex]  {
                                        ZStack {
                                            RectangleView(color: Color(.systemGreen), height: 60)
                                            Text(model.modules[moduleId].test.questions[questionId].answers[index])
                                                .foregroundColor(.white)
                                        }
                                    }
                                    else if currentQueston.answers[selectedAnswerIndex!] == currentQueston.answers[index] {
                                        ZStack {
                                            RectangleView(color: .red, height: 60)
                                            Text(model.modules[moduleId].test.questions[questionId].answers[index])
                                                .foregroundColor(.white)
                                        }
                                    }
                                    else {
                                        ZStack {
                                            RectangleView(color: Color(.systemCyan), height: 60)
                                            Text(model.modules[moduleId].test.questions[questionId].answers[index])
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                            .disabled(answerIsSubmitted)
                        }
                    }
                }
                // TODO: Add score counting
                
                // Mark: Submit / Next Question / To Results Button
                Button {
                    if !answerIsSubmitted {
                        answerIsSubmitted = true
                    }
                    
                    // TODO: check - do I need both selectors????
                    else if questionId == model.modules[moduleId].test.questions.count-1 {
                        if selectedAnswerIndex == model.modules[moduleId].test.questions[questionId].correctIndex {
                            correctAnswers += 1
                        }
                        resultsSelector = 1
                        showResuts = true
                    }
                    else {
                        if selectedAnswerIndex == model.modules[moduleId].test.questions[questionId].correctIndex {
                            correctAnswers += 1
                        }
                        answerIsSubmitted = false
                        selectedAnswerIndex = nil
                        questionId += 1
                    }
                } label: {
                    if !answerIsSubmitted {
                        ZStack {
                            RectangleView(color: .blue, height: 50)
                            Text("Submit Answer")
                                .foregroundColor(.white)
                        }
                    }
                    else if questionId >= model.modules[moduleId].test.questions.count-1 {
                        ZStack {
                            RectangleView(color: Color(.systemRed), height: 50)
                            Text("Complete - Show Results")
                                .foregroundColor(.white)
                        }
                    }
                    else {
                        ZStack {
                            RectangleView(color: Color(.systemIndigo), height: 50)
                            Text("Next Question")
                                .foregroundColor(.white)
                        }
                    }
                }
                .disabled(selectedAnswerIndex == nil)
                .padding(.top, 80)
            }
            .padding()
            .navigationTitle("\(model.modules[moduleId].category) Quiz")
            .navigationBarTitleDisplayMode(.inline)
        }
        else if showResuts == true {
            QuizResultsView(numCorrect: correctAnswers, numQuestions: model.modules[moduleId].test.questions.count)
        }
        else {
            ProgressView()
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(moduleId: 0)
            .environmentObject(ContentModel())
    }
}
