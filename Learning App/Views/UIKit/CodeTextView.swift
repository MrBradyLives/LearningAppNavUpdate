//
//  CodeTextView.swift
//  Learning App
//
//  Created by Cole Edward Dano on 13.1.2022.
//

import SwiftUI
import UIKit

struct CodeTextView: UIViewRepresentable {
    
//    @EnvironmentObject var model: ContentModel
    var htmlTextStringToInsert: NSAttributedString
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        
        return textView
    }
    
    func updateUIView(_ textView: UITextView, context: Context) {
        textView.attributedText = htmlTextStringToInsert
    }

}

//struct CodeTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        CodeTextView(htmlTextStringToInsert: <#NSAttributedString#>)
//    }
//}
