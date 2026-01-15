// Created by Chester for FlappyPlane in 2025

import SwiftUI

@main
struct FlappyPlaneApp: App {
    @State private var appModel = AppModel()
    @State private var gameManager = GameManager()

    init() {
        PlaneComponent.registerComponent()
        PlaneSystem.registerSystem()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
                .environment(gameManager)
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .environment(gameManager)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
}
