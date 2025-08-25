// Created by Chester for MSC in 2025

import SwiftUI

struct NewsInfo: Identifiable {
    let id = UUID()
    let imageName: String
}

struct NewsView: View {
    let infos = [
        NewsInfo(imageName: "Eclipse"),
        NewsInfo(imageName: "Ocean"),
        NewsInfo(imageName: "Rains"),
        NewsInfo(imageName: "Stellars"),
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
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
