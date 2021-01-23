//
//  Constants.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/23/21.
//

import UIKit
import CoreGraphics

struct Constants {
    struct APIURLs {
        static let topicsEndpoint = "https://tenpercent-interview-project.s3.amazonaws.com/topics.json"
        static let meditationsEndpoint = "https://tenpercent-interview-project.s3.amazonaws.com/meditations.json"
    }
    
    struct Colors {
        static let blackHexString = "#000000"
        static let navBarGrayHexString = "#D8D8D8"
        static let rgbaGrayBorder = UIColor(hex: "#000000", alpha: 0.1)
    }
    
    struct Copy {
        static let topicsViewTitle = "Topics"
        static let generalMeditationsGroupTitle = "Meditations"
        static let loadingText = "Loading..."
    }
    
    struct ButtonContent {
        static let backButtonLabel = "Back"
        static let backButtonSystemIcon = "arrow.backward"
    }
    
    struct LogMessages {
        static let networkError = "ERROR: Network error"
        static let jsonError = "ERROR: JSON error"
        static func getInvalidURLMessage(for url: String) -> String {
            return "Error: Invalid URL for \(url)"
        }
    }
}
