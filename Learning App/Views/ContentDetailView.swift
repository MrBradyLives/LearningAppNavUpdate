//
//  ContentDetailView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 11.1.2022.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    var moduleId: Int
    var lessonNumber: Int
    @Binding var selection: Int?
    
    var body: some View {
        
        let url = URL(string: String(Constants.videoHostUrl + model.modules[moduleId].content.lessons[lessonNumber].video))
        VStack {
            Text("Lesson \(lessonNumber+1)")
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(20)
            }
            
            // TODO: add descrition text
            
            Button {
                if lessonNumber == model.modules[moduleId].content.lessons.count {
                    selection = nil
                }
                else if selection != nil {
                    selection! += 1
                }
            } label: {
                if lessonNumber == model.modules[moduleId].content.lessons.count {
                    Text("Complete")
                }
                else if selection != nil {
                    Text("")
                }
            }
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView(moduleId: 0, lessonNumber: 0, selection: .constant(0))
            .environmentObject(ContentModel())
    }
}
