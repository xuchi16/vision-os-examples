// Created by Chester for Advance3D in 2025

import SwiftUI

@main
struct Advance3DApp: App {

    @State private var appModel = AppModel()

    init() {
        MoveComponent.registerComponent()
        MoveSystem.registerSystem()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
        WindowGroup(id: "rotate") {
            RotateView()
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "magnify") {
            MagnifyView()
        }
        .windowStyle(.volumetric)
        
        ImmersiveSpace(id: "action") {
            ActionView()
        }
        
        ImmersiveSpace(id: "earthAndMoon") {
            EarthAndMoonView()
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
