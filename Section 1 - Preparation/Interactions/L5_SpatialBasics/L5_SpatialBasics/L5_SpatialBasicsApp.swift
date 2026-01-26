//
//  L5_SpatialBasicsApp.swift
//  L5_SpatialBasics
//
//  Created by xuchi on 2024/7/3.
//

import SwiftUI

@main
struct L5_SpatialBasicsApp: App {
    
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
        
        ImmersiveSpace(id: appModel.componentImmersiveSpaceID) {
            ComponentImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
        
        
        ImmersiveSpace(id: appModel.customizeComponentSpaceID) {
            CustomizeComponentView()
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
