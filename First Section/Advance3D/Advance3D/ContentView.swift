// Created by Chester for Advance3D in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct ContentView: View {
    @Environment(AppModel.self) var appModel

    @Environment(\.openImmersiveSpace) var openSpace
    @Environment(\.openWindow) var openWindow

    var body: some View {
        VStack {
            HStack {
                Text("Drag and Move")
                    .font(.title)

                ToggleImmersiveSpaceButton(immersiveId: "eam")
                    .font(.title)
            }
            
            HStack {
                Text("Skybox")
                    .font(.title)
                
                ToggleImmersiveSpaceButton(immersiveId: appModel.immersiveSpaceID)
                    .font(.title)
            }

            HStack {
                Text("Tap Gesture")
                    .font(.title)
                Button("Tap") {
                    openWindow(id: appModel.tapGesture)
                }
                .font(.title)
            }

            HStack {
                Text("Spatial Tap Gesture")
                    .font(.title)
                Button("Spatial Tap") {
                    openWindow(id: appModel.spatialTapGesture)
                }
                .font(.title)
            }

            HStack {
                Text("Drag Gesture")
                    .font(.title)
                Button("Drag") {
                    openWindow(id: appModel.dragGesture)
                }
                .font(.title)
            }

            HStack {
                Text("Rotate Gesture")
                    .font(.title)
                Button("Rotate") {
                    openWindow(id: appModel.rotateGesture)
                }
                .font(.title)
            }

            HStack {
                Text("Magnify Gesture")
                    .font(.title)
                Button("Magnify") {
                    openWindow(id: appModel.magnifyGesture)
                }
                .font(.title)
            }

            HStack {
                Text("Gesture in One")
                    .font(.title)
                Button("All in one") {
                    openWindow(id: appModel.gestureInOne)
                }
                .font(.title)
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
