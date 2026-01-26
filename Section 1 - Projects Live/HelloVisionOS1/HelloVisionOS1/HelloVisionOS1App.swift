// Created by Chester for HelloVisionOS1 in 2025

import SwiftUI

@main
struct HelloVisionOS1App: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
        // 定义新的 WindowGroup
        // 给它一个名称
        WindowGroup(id: "window") {
            WindowView()
                .environment(appModel)
        }
        // .windowStyle(.plain)
        
        // VOLUME!!
        // 2. 给它一个新名称
        WindowGroup(id: "volume") {
            // 1. 替换为 VolumeView
            VolumeView()
                .environment(appModel)
        }
        .windowStyle(.volumetric)
        
        ImmersiveSpace(id: "space") {
            // 定义 Space 所属的 View
            SpaceView()
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed, .progressive, .full)
        
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
