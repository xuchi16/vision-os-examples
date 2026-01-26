// Created by Chester for MSCWorld in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openImmersiveSpace) var openSpace
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        VStack {
            Button {
                openWindow(id: "plane")
            } label: {
                Text("Plane")
            }
            
            Button {
                Task {
                    await openSpace(id: "portal")
                }
            } label: {
                Text("Portal")
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
