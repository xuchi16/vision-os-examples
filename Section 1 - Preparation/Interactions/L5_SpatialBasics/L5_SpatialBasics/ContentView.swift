//
//  ContentView.swift
//  L5_SpatialBasics
//
//  Created by xuchi on 2024/7/3.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(AppModel.self) private var appModel
    
    var body: some View {
        VStack {
            Text("Trasforms")
                .font(.title)
            
            ToggleImmersiveSpaceButton(immersiveId: appModel.immersiveSpaceID,
                                       buttonOnTitle: "Hide Immersive Space",
                                       buttonOffTitle: "Show Immersive Space")
            
            Text("Built-in components")
                .font(.title)
            ToggleImmersiveSpaceButton(immersiveId: appModel.componentImmersiveSpaceID,
                                       buttonOnTitle: "Hide Component Space",
                                       buttonOffTitle: "Show Component Space")
            
            Text("Customize Components")
                .font(.title)
            ToggleImmersiveSpaceButton(immersiveId: appModel.customizeComponentSpaceID,
                                       buttonOnTitle: "Hide Customize Component Space",
                                       buttonOffTitle: "Show Customize Component Space")
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
