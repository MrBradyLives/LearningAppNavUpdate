//
//  ContentModel.swift
//  Learning App
//
//  Created by Cole Edward Dano on 5.1.2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var moduleSelector: String? = nil
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        self.modules = LocalDataService.getLocalData()
        self.styleData = LocalStyleDataService.getLocalStyleData()
    }
}
