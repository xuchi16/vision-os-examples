// Created by Chester for MSCWorld in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    // 获取扳手
    @Environment(\.openWindow) var openWindow
    // 获取打开空间的扳手
    @Environment(\.openImmersiveSpace) var openSpace
    
    var body: some View {
        VStack {
            Text("MSC World!")
                .font(.title)
                .padding()
            
            // 打开 Portal View
            Button {
                Task {
                    await openSpace(id: "portal")
                }
            } label: {
                Text("Portal")
            }
            
            // 打开 Volume
            Button {
                openWindow(id: "plane")
            } label: {
                Text("My Plane")
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
