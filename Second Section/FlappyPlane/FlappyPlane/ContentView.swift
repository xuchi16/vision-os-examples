// Created by Chester for FlappyPlane in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct ContentView: View {
    @Environment(GameManager.self) var gameManager

    var body: some View {
        VStack {
            Text("Flappy Plane")
                .font(.title)
                .padding()

            Text("Score: \(gameManager.score)")
                .font(.title2)

            ToggleImmersiveSpaceButton()
            Button {
                gameManager.jump()
            } label: {
                Text("JUMP")
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
