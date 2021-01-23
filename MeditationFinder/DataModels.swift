//
//  DataModels.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/23/21.
//

import Foundation

struct Topic: Codable {
    let uuid: String            // Globally unique identifier
    let title: String           // Name of the topic
    let position: Int           // Integer used for sorting relative to other topics
    let parentUuid: String?     // Null values indicate parent-level topics. Non null values indicate that this topic is a subtopic of the referenced UUID.
    let meditations: [String]   // Array of meditation UUIDs contained within this topic.
    let featured: Bool          // Boolean indicating whether this topic is featured.
    let color: String?          // Hex color code for this topic
    var description: String?    // Text describing the topic.
}

struct TopicList: Codable {
    let topics: [Topic]
}

struct DisplayTopic {
    let topic: Topic
    let subtopics: [Topic]
}

struct Meditation: Codable {
    let uuid: String            // Globally unique identifier
    let title: String           // Name of the meditation
    let teacherName: String     // Name of the meditation's teacher
    let imageUrl: String        // URL pointing to an image asset
    let playCount: Int?         // How many times this meditation has been played
}

struct MeditationList: Codable {
    let meditations: [Meditation]
}
