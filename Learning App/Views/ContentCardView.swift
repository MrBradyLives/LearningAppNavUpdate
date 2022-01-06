//
//  ContentCardView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 6.1.2022.
//

import SwiftUI

struct ContentCardView: View {
    
    var image: String
    var category: String
    var description: String
    var contentNumber: Int
    var time: String
    
    var body: some View {
        ZStack {
 
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                .aspectRatio(CGSize(width: 2.15, height: 1), contentMode: .fit)
            
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116, alignment: .center)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Let's Learn \(category)")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(description)
                        .font(.subheadline)
                        .padding(.bottom)
                    
                    HStack {
                        Image(systemName: "chart.bar.doc.horizontal.fill")
                        Text("\(contentNumber) Lessons")
                            .font(.footnote)
                        Spacer()
                        Image(systemName: "clock.fill")
                        Text(time)
                            .font(.footnote)
                    }
                }
                .padding(.leading)
            }
            .padding()
        }
        .padding()
    }
}

struct ContentCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentCardView(image: "swift", category: "Swift", description: "Understand the fundamentals of the Swift programming language.", contentNumber: 10, time: "3 hours")
    }
}
