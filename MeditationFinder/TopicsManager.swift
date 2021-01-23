//
//  TopicsManager.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/23/21.
//

import Foundation

struct TopicsManager {
    static func fetchTopics(completionHandler: @escaping (_ filteredTopicList: [Topic]) -> Void) {
        APIClient.getInformation(from: URL(string: Constants.APIURLs.topicsEndpoint)!) { responseData in
            guard let responseData = responseData else {
                print(Constants.LogMessages.networkError)
                return
            }
            
            var topics = [Topic]()
            
            if let decodedResponse = APIClient.decodeJSON(json: responseData, as: TopicList.self) {
                topics = decodedResponse.topics
            }
            
            completionHandler(topics)
        }
    }

    static func getDisplayTopics(from topics: [Topic]) -> [DisplayTopic] {
        var displayTopics = [DisplayTopic]()
        
        topics.forEach { topic in
            if topic.featured || topic.parentUuid == nil {
                let subtopics = topics.filter { topic.uuid == $0.parentUuid }
                let displayTopic = DisplayTopic(topic: topic, subtopics: subtopics)
                displayTopics.append(displayTopic)
            }
        }
        
        displayTopics.sort { $0.topic.position < $1.topic.position }
        return displayTopics
    }
    
    static func getMeditationCount(for displayTopic: DisplayTopic) -> Int {
        let subtopicMeditationCount = displayTopic.subtopics.reduce(0, { (accumulation: Int, nextValue: Topic) -> Int in
            return accumulation + nextValue.meditations.count
        })
        
        return displayTopic.topic.meditations.count + subtopicMeditationCount
    }
}
