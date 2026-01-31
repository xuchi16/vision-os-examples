// Created by Chester for Diorama in 2026

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) var openWindow
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")
            
            Button("Open Diorama") {
                openWindow(id: "diorama")
            }

            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
