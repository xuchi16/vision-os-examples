// Created by Chester for Portal in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) var openWindow

    var body: some View {
        VStack {
            Text("Portal view")
                .font(.title)
            
            Button("Open Portal") {
                openWindow(id: "portal-view")
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
