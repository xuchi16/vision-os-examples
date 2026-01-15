// Created by Chester for SystemGestures in 2025

import SwiftUI

@main
struct SystemGesturesApp: App {
    @State private var appModel = AppModel()
    private let size: CGFloat = 400

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
        WindowGroup(id: appModel.tapGesture) {
            TapGestureView()
                .frame(width: size, height: size)
                .frame(depth: size)
        }
        .windowStyle(.volumetric)

        WindowGroup(id: appModel.spatialTapGesture) {
            SpatialTapGestureView()
                .frame(width: size, height: size)
                .frame(depth: size)
        }
        .windowStyle(.volumetric)

        WindowGroup(id: appModel.dragGesture) {
            DragGestureView()
        }
        .windowStyle(.volumetric)

        WindowGroup(id: appModel.rotateGesture) {
            RotateGesture3DView()
        }
        .windowStyle(.volumetric)

        WindowGroup(id: appModel.magnifyGesture) {
            MagnifyGestureView()
        }
        .windowStyle(.volumetric)

        WindowGroup(id: appModel.gestureInOne) {
            GestureInOneView()
        }
        .windowStyle(.volumetric)

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
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
