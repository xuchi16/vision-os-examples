// Created by Chester for Advance3D in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @Environment(\.openImmersiveSpace) var openSpace
    
    // 获取 Window
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        VStack {
            Button {
                Task {
                    await openSpace(id: "earthAndMoon")
                }
            } label: {
                Text("Earth and Moon")
            }
            
            Button {
                openWindow(id: "rotate")
            } label: {
                Text("Rotate")
            }
            
            Button {
                openWindow(id: "magnify")
            } label: {
                Text("Magnify")
            }

            Button {
                Task {
                    await openSpace(id: "action")
                }
            } label: {
                Text("Open Action Space")
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
