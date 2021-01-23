//
//  TopicsView.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/23/21.
//

import SwiftUI

struct DisplayTopicListView: View {
    @EnvironmentObject var displayDataController: DisplayDataController
    
    init() {
        let navBarStyle = UINavigationBarAppearance()
        navBarStyle.backgroundColor = UIColor(hex: Constants.Colors.navBarGrayHexString)
        navBarStyle.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navBarStyle.titleTextAttributes = [.foregroundColor: UIColor.black]

        UINavigationBar.appearance().scrollEdgeAppearance = navBarStyle
        UINavigationBar.appearance().standardAppearance = navBarStyle
    }
    
    var body: some View {
        VStack {
            if displayDataController.displayTopics.count > 0 {
                ScrollView {
                    ForEach(displayDataController.displayTopics, id: \.topic.uuid) {
                        DisplayTopicRow(displayTopic: $0)
                    }
                }
                    .padding(8)
            } else {
                Text(Constants.Copy.loadingText)
            }
            
        }
            // navigationTitle is new to ios 14 and throwing some logs about layout constraints
            // if you comment out navigationTitle it does not log the errors
            // looks like an xcode bug: https://stackoverflow.com/a/65318356
            .navigationTitle(Constants.Copy.topicsViewTitle)
            .navigationBarTitleDisplayMode(.large)
    }
}

struct TopicsView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayTopicListView()
    }
}
