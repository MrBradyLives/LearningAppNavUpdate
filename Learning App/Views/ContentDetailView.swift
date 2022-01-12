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
        


        VStack {
            Text("Hello this is lesson \(lessonId + 1)")
            Text("Lesson Title: \(model.modules[moduleId].content.lessons[lessonId].title)")
            
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(20)
            }
            
            Button {
                if selection == model.modules[moduleId].content.lessons.count-1 {
                    model.moduleSelector = nil
                }
                else {
                    selection! += 1
                }
            } label: {
                if selection == model.modules[moduleId].content.lessons.count-1 {
                    Text("Complete - Return Home")
                }
                else {
                    Text("Next Lesson - \(model.modules[moduleId].content.lessons[lessonId+1].title)")
                }
            }
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView(moduleId: 0, lessonId: 0, selection: .constant(0))
            .environmentObject(ContentModel())
    }
}
