//
//  TopicRow.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/23/21.
//

import SwiftUI

struct DisplayTopicRow: View {
    let displayTopic: DisplayTopic
    var totalMeditations: Int { TopicsManager.getMeditationCount(for: displayTopic) }
    @State private var linkIsActive = false
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationLink(destination: TopicView(displayTopic: displayTopic), isActive: $linkIsActive) {
            HStack {
                Color(UIColor(hex: displayTopic.topic.color ?? Constants.Colors.blackHexString))
                    .frame(width: 12)
                    .padding(.trailing, 8)
                VStack(alignment: .leading, spacing: 0) {
                    Text(displayTopic.topic.title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .padding(.top, 20)
                    Text("\(totalMeditations) meditations")
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.lightGray))
                        .padding(.top, 8)
                        .padding(.bottom, 20)
                }
                Spacer()
            }
                .frame(height: 80)
                .border(Color(Constants.Colors.rgbaGrayBorder), width: 2)
                .cornerRadius(4)
                .padding(4)
        }
    }
}
