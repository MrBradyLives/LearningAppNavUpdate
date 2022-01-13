//
//  ContentModel.swift
//  Learning App
//
//  Created by Cole Edward Dano on 5.1.2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    // Used to pop back to home view from last view in stack
    @Published var moduleSelector: String? = nil
    
    // For CodeTextView to display properly formatted text
    var styleData: Data?
    
    init() {
        self.modules = LocalDataService.getLocalData()
        self.styleData = LocalStyleDataService.getLocalStyleData()
    }
    
    // MARK: - Code Styling and convert to AttributedString
    
    func addCodeStyling(_ htmlString: String) -> NSAttributedString {
        
        var htmlCodeString = NSAttributedString()
        var data = Data()
        
        // add .css styling data
        if styleData != nil {
            data.append(styleData!)
        }
        
        // add html
        data.append(Data(htmlString.utf8))
        
        // convert to attributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            htmlCodeString = attributedString
        }
        return htmlCodeString
    }
}

