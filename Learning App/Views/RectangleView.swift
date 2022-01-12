//
//  RectangleView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 12.1.2022.
//

import SwiftUI

struct RectangleView: View {
    
    var color: Color
    var height: CGFloat
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(15)
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
            .frame(height: height)
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView(color: .white, height: 80)
    }
}
