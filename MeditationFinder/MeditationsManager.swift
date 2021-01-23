//
//  MeditationsManager.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/24/21.
//

import Foundation

struct MeditationsManager {
    static func fetchMeditations(completionHandler: @escaping (_ meditations: [Meditation]) -> Void) {
        APIClient.getInformation(from: URL(string: Constants.APIURLs.meditationsEndpoint)!) { responseData in
            guard let responseData = responseData else {
                print(Constants.LogMessages.networkError)
                return
            }
            
            var meditations = [Meditation]()
            
            if let decodedResponse = APIClient.decodeJSON(json: responseData, as: MeditationList.self) {
                meditations = decodedResponse.meditations
            }
            
            completionHandler(meditations)
        }
    }
    
    static func getMeditations(for meditationIds: [String], in listOfMeditations: [Meditation]) -> [Meditation] {
        var meditations = listOfMeditations.filter { meditationIds.contains($0.uuid) }
        meditations.sort { $0.playCount ?? 0 > $1.playCount ?? 0 }
        return meditations
    }
    
    static func fetchImage(from url: URL, completionHandler: @escaping (_ imageData: Data?) -> Void) {
        if !url.absoluteString.hasPrefix("http") {
            print(Constants.LogMessages.getInvalidURLMessage(for: url.absoluteString))
            return
        }
        
        APIClient.getInformation(from: url) { responseData in
            completionHandler(responseData)
        }
    }
}
