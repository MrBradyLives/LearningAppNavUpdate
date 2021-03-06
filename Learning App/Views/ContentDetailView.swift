//
//  ContentDetailView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 12.1.2022.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model: ContentModel
    var moduleId: Int
    var lessonId: Int
    @Binding var selection:Int?
    

    
    var body: some View {
        
        let url = URL(string: Constants.videoHostUrl + model.modules[moduleId].content.lessons[lessonId].video)
        
        let htmlTextString =  model.addCodeStyling(model.modules[moduleId].content.lessons[lessonId].explanation)

        VStack(alignment: .leading) {
                Text(model.modules[moduleId].content.lessons[lessonId].title)
                .font(.title2)
                .fontWeight(.semibold)
            
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(20)
            }
            
            CodeTextView(htmlTextStringToInsert: htmlTextString)
            
            Button {
                if selection == nil {
                    selection = lessonId
                }
                
                if lessonId == model.modules[moduleId].content.lessons.count-1 {
                    model.moduleSelector = nil
                }
                else {
                    selection! += 1
                }
            } label: {
                if lessonId == model.modules[moduleId].content.lessons.count-1 {
                    ZStack {
                        RectangleView(color: Color(.systemPink), height: 50)
                        Text("Complete - Return Home")
                            .foregroundColor(.white)
                    }
                }
                else {
                    ZStack {
                        RectangleView(color: Color(.systemBlue), height: 50)
                        Text("Next Lesson - \(model.modules[moduleId].content.lessons[lessonId+1].title)")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Lesson \(lessonId + 1)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView(moduleId: 0, lessonId: 0, selection: .constant(0))
            .environmentObject(ContentModel())
    }
}
