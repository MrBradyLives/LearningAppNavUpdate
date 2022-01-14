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
    
    var body: some View {
        
        let htmlString = model.addCodeStyling(model.modules[moduleId].test.questions[questionId].content)
        let currentQueston = model.modules[moduleId].test.questions[questionId]
        
        if resultsSelector == 0 {
            VStack {
                Text("Question: \(questionId+1)")
                    .font(.largeTitle)
                    .padding()
                Text("Question ID: \(questionId)")
                Text("Count-1: \(model.modules[moduleId].test.questions.count-1)")
                
                CodeTextView(htmlTextStringToInsert: htmlString)
                
                //Mark: Answers Stack
                ScrollView {
                    VStack {
                        ForEach(0...model.modules[moduleId].test.questions[questionId].answers.count-1, id: \.self) { index in
                            
                            Button {
                                selectedAnswerIndex = index
                            } label: {
                                
                                // Button grey when pressed
                                if answerIsSubmitted == false {
                                    ZStack {
                                        RectangleView(color: index == selectedAnswerIndex ? .gray : .white, height: 60)
                                        Text(model.modules[moduleId].test.questions[questionId].answers[index])
                                            .foregroundColor(index == selectedAnswerIndex ? .white : .black)
                                    }
                                }
                                else {
                                    if currentQueston.answers[index] == currentQueston.answers[currentQueston.correctIndex]  {
                                        ZStack {
                                            RectangleView(color: .green, height: 60)
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
                                            RectangleView(color: .white, height: 60)
                                            Text(model.modules[moduleId].test.questions[questionId].answers[index])
                                                .foregroundColor(.black)
                                        }
                                    }
                                }
                            }
                            
                            
                            
                            //                            if selectedAnswerIndex == model.modules[moduleId].test.questions[questionId].correctIndex {
                            //                                ZStack {
                            //                                    RectangleView(color: .green, height: 60)
                            //                                    Text(model.modules[moduleId].test.questions[questionId].answers[index])
                            //                                        .foregroundColor(.white)
                            //                                }
                            //                            }
                            //                            else if {
                            //                                ZStack {
                            //                                    RectangleView(color: .red, height: 60)
                            //                                    Text(model.modules[moduleId].test.questions[questionId].answers[index])
                            //                                        .foregroundColor(.black)
                            //                                }
                            //                            }
                            //                            else {
                            //                                ZStack {
                            //                                    RectangleView(color: .white, height: 60)
                            //                                    Text(model.modules[moduleId].test.questions[questionId].answers[index])
                            //                                        .foregroundColor(.black)
                            //                                }
                            //                            }
                        }
                    }
                }
                
                // Mark: Submit / Next Question / To Results Button
                Button {
                    
                    answerIsSubmitted = true
                    
                    //                    if !answerIsSubmitted {
                    //
                    //                    }
                    //
                    //                    else if questionId == model.modules[moduleId].test.questions.count-1 {
                    //                        resultsSelector = 1
                    //                    }
                    //                    else {
                    //                        questionId += 1
                    //                    }
                } label: {
                    if !answerIsSubmitted {
                        ZStack {
                            RectangleView(color: .blue, height: 50)
                            Text("Submit Answer")
                                .foregroundColor(.white)
                        }
                    }
                    else if questionId >= model.modules[moduleId].test.questions.count-2 {
                        ZStack {
                            RectangleView(color: .red, height: 50)
                            Text("Complete - Show Results")
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
                .padding(.top, 80)
            }
            .padding()
        }
        else if showResuts == true {
            QuizResultsView(numCorrect: 10, numQuestions: 10)
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
