//
//  LocalDataService.swift
//  Learning App
//
//  Created by Cole Edward Dano on 5.1.2022.
//

import Foundation
import SwiftUI

class LocalDataService {
    
    static func getLocalData() -> [Module] {
        
        // get path
        
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        guard pathString != nil else {
            return [Module]()
        }
        
        // convert path to url
        let url = URL(fileURLWithPath: pathString!)
        
        // convert url to data
        do {
            let data = try Data(contentsOf: url)
            
            // decode data
            do {
                let moduleData = try JSONDecoder().decode([Module].self, from: data)
                
                // return data to [Module]
                return moduleData
                
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        return [Module]()
    }
    
}
