// Created by Chester for MSCWorld in 2025

import SwiftUI

@main
struct MSCWorldApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
        WindowGroup(id: "plane") {
            PlaneView()
        }
        .windowStyle(.volumetric)

        // 定义 space
        ImmersiveSpace(id: "portal") {
            PortalView()
        }
        
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
