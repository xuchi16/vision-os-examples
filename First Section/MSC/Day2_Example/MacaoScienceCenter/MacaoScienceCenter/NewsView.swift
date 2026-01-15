// Created by Chester for MacaoScienceCenter in 2025

import SwiftUI

struct NewsInfo: Identifiable {
    let id = UUID()
    let imageName: String
}

struct NewsView: View {
    let infos = [
        NewsInfo(imageName: "Ocean"),
        NewsInfo(imageName: "Eclipse"),
        NewsInfo(imageName: "Stellars"),
        NewsInfo(imageName: "Rains")
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHStack(spacing: 10.0) {
                ForEach(infos) { info in
                    Image(info.imageName)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    NewsView()
}
