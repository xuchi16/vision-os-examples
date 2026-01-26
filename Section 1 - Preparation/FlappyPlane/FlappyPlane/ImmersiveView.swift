// Created by Chester for FlappyPlane in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct ImmersiveView: View {
    @Environment(GameManager.self) private var gameManager

    var body: some View {
        RealityView { content in
            content.add(gameManager.rootEntity)
            gameManager.handleCollision(content: content)
        }
        .gesture(
            SpatialTapGesture()
                .targetedToAnyEntity()
                .onEnded { value in
                    if value.entity.name == "plane" {
                        gameManager.jump()
                    }
                }
        )
        .task {
            do {
                _ = try await gameManager.spawnPlane()
            } catch {
                print("Failed to spawn the plane")
            }
        }
        .task {
            gameManager.startSchedulingClouds()
        }
        .onDisappear {
            gameManager.stop()
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
