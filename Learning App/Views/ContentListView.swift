//
//  ContentListView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 11.1.2022.
//

import SwiftUI

struct ContentListView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selection:Int?
    var moduleId: Int
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(model.modules[moduleId].content.lessons) { lesson in
                    
                    NavigationLink(tag: lesson.id, selection: $selection) {
                        ContentDetailView(moduleId: moduleId, lessonId: lesson.id, selection: $selection)
                    } label: {
                        ContentListCardView(lessonNumber: lesson.id, lessonTitle: lesson.title, lessonDuration: lesson.duration)
                    }
                }
            }
            .foregroundColor(.black)
        }
    }
}

struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView(moduleId: 0)
            .environmentObject(ContentModel())
    }
}
