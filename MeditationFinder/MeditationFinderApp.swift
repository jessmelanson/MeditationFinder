//
//  MeditationFinderApp.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/23/21.
//

import SwiftUI

@main
struct MeditationFinderApp: App {
    let displayDataController = DisplayDataController()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                DisplayTopicListView()
            }
                .accentColor(.black)
                .onAppear(perform: loadData)
                .environmentObject(displayDataController)
        }
    }
    
    func loadData() {
        TopicsManager.fetchTopics { topics in
            DispatchQueue.main.async {
                self.displayDataController.displayTopics = TopicsManager.getDisplayTopics(from: topics)
            }
        }
        
        MeditationsManager.fetchMeditations { meditations in
            DispatchQueue.main.async {
                self.displayDataController.meditations = meditations
            }
        }
    }
}
