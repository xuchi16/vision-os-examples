// Created by Chester for MSCWorld in 2025

import Foundation
import RealityKit

extension Entity {
    func playAnimationLoop() {
        for animation in self.availableAnimations {
            let loop = animation.repeat(count: .max)
            self.playAnimation(loop)
        }
    }
}
