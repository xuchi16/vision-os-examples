// Created by Chester for Physics in 2025

import SwiftUI

@main
struct PhysicsApp: App {
    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }

        WindowGroup(id: appModel.gravity) {
            GravityView()
        }
        .windowStyle(.volumetric)

        WindowGroup(id: appModel.force) {
            ForceView()
        }
        .windowStyle(.volumetric)

        WindowGroup(id: appModel.torque) {
            TorqueView()
        }
        .windowStyle(.volumetric)

        WindowGroup(id: appModel.restitution) {
            RestitutionView()
        }
        .windowStyle(.volumetric)

        WindowGroup(id: appModel.friction) {
            FrictionView()
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
