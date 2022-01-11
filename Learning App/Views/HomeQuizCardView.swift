//
//  HomeQuizCardView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 6.1.2022.
//

import SwiftUI

struct HomeQuizCardView: View {
    
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
                ZStack {
                    Image(image)
                        .resizable()
                        .clipShape(Circle())
                        .colorInvert()
                    Image(systemName: "questionmark.circle")
                        .resizable()
                        .foregroundColor(Color(.sRGB, red: 1, green: 1, blue: 1, opacity: 0.8))
                        .padding(10)
                }
                .frame(width: 116, height: 116, alignment: .center)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Let's take a \(category) test!")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(description)
                        .font(.subheadline)
                        .padding(.bottom)
                    
                    HStack {
                        Image(systemName: "chart.bar.doc.horizontal.fill")
                        Text("\(contentNumber) Questions")
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

struct HomeQuizCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeQuizCardView(image: "swift", category: "Swift", description: "Gear up and put your Swift knowledge to the test.", contentNumber: 10, time: "30 minutes")
    }
}
