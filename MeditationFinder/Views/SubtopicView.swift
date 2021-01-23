//
//  SubtopicView.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/24/21.
//

import SwiftUI

struct SubtopicView: View {
    @EnvironmentObject var displayDataController: DisplayDataController
    let title: String
    let meditationIds: [String]
    var meditations: [Meditation] { MeditationsManager.getMeditations(for: meditationIds, in: displayDataController.meditations) }

    var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                if meditations.count > 0 {
                    ForEach(meditations, id: \.uuid) {
                        MeditationRowView(meditation: $0)
                    }
                } else {
                    Text(Constants.Copy.loadingText)
                }
            }
                .padding(.bottom, 40)
    }
}
