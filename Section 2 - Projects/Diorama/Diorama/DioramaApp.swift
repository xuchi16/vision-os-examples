// Created by Chester for Diorama in 2026

import SwiftUI

@main
struct DioramaApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
        WindowGroup(id: "diorama") {
            DioramaView()
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "video") {
            VideoPlayerWindowView()
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
