//
//  HomeView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 5.1.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                ScrollView {
                    
                    LazyVStack {
                        ForEach(model.modules) { module in
                            // MARK: Content Card
                            ContentCardView(image: module.content.image, category: module.category, description: module.content.description, contentNumber: module.content.lessons.count, time: module.content.time)
                            
                            // MARK: Quiz Card
                            QuizCardView(image: module.test.image, category: module.category, description: module.test.description, contentNumber: module.test.questions.count, time: module.test.time)
                        }
                    }
                    
                    
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
