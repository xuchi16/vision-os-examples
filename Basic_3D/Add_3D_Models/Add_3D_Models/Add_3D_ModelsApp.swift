// Created by Chester for Add_3D_Models in 2025

import SwiftUI

@main
struct Add_3D_ModelsApp: App {

    @State private var appModel = AppModel()
    @State private var currentImmersionStyle: ImmersionStyle = .progressive
    
    var body: some Scene {
        WindowGroup {
            ContentView(immersionStyle: $currentImmersionStyle)
                .environment(appModel)
        }

        WindowGroup(id: "moon") {
            MoonWindowView()
        }
        
        WindowGroup(id: "moon-volumetric") {
            MoonView()
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "url-model") {
            UrlModelView()
        }
        .windowStyle(.volumetric)
        
        WindowGroup(id: "moon-in-reality-view") {
            MoonRealityView()
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.8, height: 0.8, depth: 0.8, in: .meters)

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
        .immersionStyle(selection: $currentImmersionStyle, in: .mixed, .progressive, .full)
     }
}
