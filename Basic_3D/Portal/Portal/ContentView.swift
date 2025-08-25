// Created by Chester for Portal in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) var openWindow
    @Environment(\.openImmersiveSpace) var openSpace

    var body: some View {
        VStack {
            Text("Portal view")
                .font(.title)
            
            Button("Open Portal") {
                openWindow(id: "portal-view")
            }
            
            Button("Open Portal") {
                Task {
                    await openSpace(id: "portal-space")
                }
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
