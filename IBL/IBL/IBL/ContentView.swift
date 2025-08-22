// Created by Chester for IBL in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Image Based Lighting")
                .font(.extraLargeTitle2)
                .padding()

            ToggleImmersiveSpaceButton()
                .padding()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
