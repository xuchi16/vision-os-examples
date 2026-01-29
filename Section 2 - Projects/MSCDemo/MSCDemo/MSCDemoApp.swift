// Created by Chester for MSCDemo in 2026

import SwiftUI

@main
struct MSCApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
        WindowGroup(id: "mas") {
            MoonAndSunView()
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "diorama") {
            DioramaView()
        }
        .windowStyle(.volumetric)
        
        ImmersiveSpace(id: "masSpace") {
            MoonAndSunSpaceView()
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)

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
