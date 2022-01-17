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
        getRemoteData()
    }
    
    // MARK: - Get Css Code Styling and Convert to AttributedString
    
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
    
    // MARK: - Remote Data
    func getRemoteData() {

        let urlString = "https://raw.githubusercontent.com/MrBradyLives/LearningAppData/main/data2.json"
        let url = URL(string: urlString)
        guard url != nil else {
            return
        }

        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                return
            }
            do {
                let remoteModuleData = try JSONDecoder().decode([Module].self, from: data!)
                DispatchQueue.main.async {
                    self.modules += remoteModuleData
                }
            }
            catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}

