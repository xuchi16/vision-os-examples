// Created by Chester for Window in 2025

import SwiftUI

@main
struct WindowApp: App {
    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
                .frame(minWidth: 800, maxWidth: 1000,
                       minHeight: 600, maxHeight: 800)
        }
        .defaultSize(CGSize(width: 800, height: 600))
        .windowResizability(.contentSize)

        WindowGroup(id: "instructor") {
            InstructorView()
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
