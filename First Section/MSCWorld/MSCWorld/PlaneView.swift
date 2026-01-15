// Created by Chester for MSCWorld in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct PlaneView: View {
    var body: some View {
        RealityView { content in
            if let plane = try? await Entity(named: "plane", in: realityKitContentBundle) {
                plane.scale *= 0.1
                plane.playAnimationWithInifiniteLoop()
                content.add(plane)
            }
        }
    }
}

extension Entity {
    func playAnimationWithInifiniteLoop() {
        for animation in self.availableAnimations {
            let repeatition = animation.repeat(count: .max)
            let _ = self.playAnimation(repeatition)
            return
        }
    }
}


#Preview {
    PlaneView()
}
