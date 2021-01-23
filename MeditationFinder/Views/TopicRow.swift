//
//  TopicRow.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/23/21.
//

import SwiftUI

struct DisplayTopicRow: View {
    let color: String?
    let title: String
    let totalMeditations: Int

    var body: some View {
        HStack {
            Color(UIColor(hex: color ?? "#000000")!)
                .frame(width: 12)
                .padding(.trailing, 10)
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                Text("\(totalMeditations) meditations")
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.lightGray))
                    .padding(.top, 10)
                    .padding(.bottom, 20)
            }
            Spacer()
        }
        .frame(minHeight: 80)
            .border(Color(UIColor.systemGray6), width: 2)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(4)
    }
}

struct TopicRow_Previews: PreviewProvider {
    static var previews: some View {
        DisplayTopicRow(color: "#000000", title: "Test", totalMeditations: 38)
    }
}
