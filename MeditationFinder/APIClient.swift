//
//  APIClient.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/23/21.
//

import Foundation

class APIClient {
    static func getInformation(from url: URL, completionHandler: @escaping (_ responseData: Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, let data = data else {
                print(Constants.LogMessages.networkError)
                return
            }
            
            if error != nil || httpResponse.statusCode != 200 {
                print("\(error?.localizedDescription ?? Constants.LogMessages.networkError)")
                return
            }
            
            completionHandler(data)
        }
        
        task.resume()
    }
    
    static func decodeJSON<T: Decodable>(json: Data, as decodedType: T.Type) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        if let decodedData = try? decoder.decode(decodedType.self, from: json) {
            return decodedData
        }
        
        return nil
    }
}
