// Created by Chester for Physics in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(AppModel.self) var appModel
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        VStack {
            HStack {
                Text("Gravity")
                    .font(.title)
                Button("Open") {
                    openWindow(id: appModel.gravity)
                }
                .font(.title)
            }
            
            HStack {
                Text("Force")
                    .font(.title)
                Button("Open") {
                    openWindow(id: appModel.force)
                }
                .font(.title)
            }
            
            HStack {
                Text("Torque")
                    .font(.title)
                Button("Open") {
                    openWindow(id: appModel.torque)
                }
                .font(.title)
            }
            
            HStack {
                Text("Bounce")
                    .font(.title)
                Button("Open") {
                    openWindow(id: appModel.restitution)
                }
                .font(.title)
            }
            
            HStack {
                Text("Friction")
                    .font(.title)
                Button("Open") {
                    openWindow(id: appModel.friction)
                }
                .font(.title)
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
