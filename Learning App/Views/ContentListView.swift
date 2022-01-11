//
//  ContentListView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 11.1.2022.
//

import SwiftUI

struct ContentListView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var selecton:Int? = nil
    var moduleId: Int
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(model.modules[moduleId].content.lessons) { lesson in
                    
                    NavigationLink(tag: lesson.id, selection: $selecton) {
                        ContentDetailView(moduleId: moduleId, lessonNumber: lesson.id, selection: $selecton)
                    } label: {
                        ContentListCardView(lessonNumber: lesson.id+1, lessonTitle: lesson.title, lessonDuration: lesson.duration)
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
