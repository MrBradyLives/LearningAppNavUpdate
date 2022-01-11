//
//  ContentListCardView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 11.1.2022.
//

import SwiftUI

struct ContentListCardView: View {
    var lessonNumber: Int
    var lessonTitle: String
    var lessonDuration: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                .aspectRatio(CGSize(width: 5, height: 1), contentMode: .fit)
            
            HStack {
                Text(String(lessonNumber))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 30)
                VStack(alignment: .leading, spacing: 7) {
                    Text(lessonTitle)
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(lessonDuration)
                }
                Spacer()
            }
            .padding()
        }
        .padding(.horizontal)
    }
}

struct ContentListCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListCardView(lessonNumber: 1, lessonTitle: "Dummy Lesson Title", lessonDuration: "20 minutes")
    }
}
