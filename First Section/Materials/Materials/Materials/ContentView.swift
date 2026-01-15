// Created by Chester for Materials in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct ContentView: View {
    @State var tag = "materials"
    var body: some View {
        VStack {
            TabView(selection: $tag) {
                MaterialsView()
                    .tabItem {
                        Label("Materials", systemImage: "square.3.layers.3d.down.backward")
                    }
                    .tag("materials")

                PBRView()
                    .tabItem {
                        Label("PBR", systemImage: "light.overhead.right")
                    }
                    .tag("PBR")
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
