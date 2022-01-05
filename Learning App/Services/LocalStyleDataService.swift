//
//  LocalStyleDataService.swift
//  Learning App
//
//  Created by Cole Edward Dano on 5.1.2022.
//

import Foundation

class LocalStyleDataService {
    
    static func getLocalStyleData() -> Data? {
        
        // get path and make sure it exists
        
        let pathString = Bundle.main.path(forResource: "style", ofType: "html")
        
        guard pathString != nil else {
            return nil
        }
        // get url from path
        let url = URL(fileURLWithPath: pathString!)
        
        // fetch data from url
        do {
            let data = try Data(contentsOf: url)
            
            // Don't decode the data now though, just return the data.
            
            return data
        }
        catch {
            print(error)
        }
        
        return nil
    }
}
