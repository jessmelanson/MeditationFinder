//
//  DisplayDataController.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/24/21.
//

import Foundation

final class DisplayDataController: ObservableObject {
    @Published var displayTopics = [DisplayTopic]()
    @Published var meditations = [Meditation]()
}
