// Created by Chester for MSCWorld in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct ImmersiveView: View {
    @Environment(HandTrackModel.self) var handTrack

    var body: some View {
        RealityView { content in
            content.add(handTrack.setupEntity())
        }
        .task {
            await handTrack.runSession()
        }
        .task {
            await handTrack.processHandUpdates()
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
