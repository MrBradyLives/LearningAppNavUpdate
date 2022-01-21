//
//  RemoteDataService.swift
//  Learning App
//
//  Created by Cole Edward Dano on 21.1.2022.
//

import Foundation
import SwiftUI

struct RemoteDataService {
    let urlString: String
    
    // TODO: Add Error Enum and handling
    func getRemoteJSON<T: Decodable>(completion: @escaping (Result<T, RemoteDataServiceError>) -> Void) {
        guard let url = URL(string: urlString)
        else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
            else {
                completion(.failure(.invalidHTTPResponse))
                return
            }
            guard error == nil
            else {
                completion(.failure(.dataTaskError))
                return
            }
            guard let data = data
            else {
                completion(.failure(.dataTaskError))
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            }
            catch {
                completion(.failure(.decodingError))
            }
        }
        .resume()
    }
}

enum RemoteDataServiceError: Error {
    case invalidURL
    case invalidHTTPResponse
    case dataTaskError
    case dataCorrupt
    case decodingError
}
