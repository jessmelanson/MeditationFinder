//
//  TopicView.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/24/21.
//

import SwiftUI

struct TopicView: View {
    let displayTopic: DisplayTopic
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                if let description = displayTopic.topic.description {
                    Text(description)
                        .font(.body)
                        .padding(.bottom, 28)
                }
                
                ForEach(displayTopic.subtopics, id: \.uuid) {
                    SubtopicView(title: $0.title, meditationIds: $0.meditations)
                }
                
                SubtopicView(title: Constants.Copy.generalMeditationsGroupTitle, meditationIds: displayTopic.topic.meditations)
                    .navigationTitle(displayTopic.topic.title)
            }
        }
            .padding()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Label(Constants.ButtonContent.backButtonLabel, systemImage: Constants.ButtonContent.backButtonSystemIcon)
                    })
                }
            }
    }
}
