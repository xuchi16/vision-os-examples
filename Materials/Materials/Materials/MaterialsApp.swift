// Created by Chester for Materials in 2025

import SwiftUI

@main
struct MaterialsApp: App {

    @State private var appModel = AppModel()
    private let size: CGFloat = 400

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
        WindowGroup(id: "simple-metallic-material") {
            SimpleMetallicMaterialView()
                .frame(width: size, height: size)
                .frame(depth: size)
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "simple-non-metallic-material") {
            SimpleNonMetallicMaterialView()
                .frame(width: size, height: size)
                .frame(depth: size)
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "unlit-material") {
            UnlitMaterialView()
                .frame(width: size, height: size)
                .frame(depth: size)
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "occlusion-material") {
            OcclusionMaterialView()
                .frame(width: size, height: size)
                .frame(depth: size)
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
