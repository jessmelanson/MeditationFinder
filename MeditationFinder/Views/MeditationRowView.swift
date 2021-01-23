//
//  MeditationRowView.swift
//  MeditationFinder
//
//  Created by Jessica Melanson on 1/24/21.
//

import SwiftUI

struct MeditationRowView: View {
    let meditation: Meditation
    @State private var image: UIImage? = nil
    
    var body: some View {
        HStack {
            if let image = image {
                Image(uiImage: image)
                    .modifier(MeditationImage())
            } else {
                Color.gray
                    .modifier(MeditationImage())
            }
            
            VStack(alignment: .leading, spacing: 0) {
                Text(meditation.title)
                    .font(.headline)
                    .padding(.bottom, 4)
                Text(meditation.teacherName)
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.lightGray))
            }
        }
            .padding(.vertical, 8)
            .onAppear {
                MeditationsManager.fetchImage(from: URL(string: meditation.imageUrl)!) { imageData in
                    guard let imageData = imageData else { return }

                    DispatchQueue.main.async {
                        self.image = UIImage(data: imageData)
                    }
                }
            }
    }
}

struct MeditationImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
            .cornerRadius(4)
            .padding(.trailing, 8)
    }
}
