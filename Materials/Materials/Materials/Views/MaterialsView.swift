// Created by Chester for Materials in 2025

import SwiftUI

struct MaterialsView: View {
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
    var body: some View {
        VStack {
            VStack {
                Text("Simple Material")
                    .font(.extraLargeTitle2)
                HStack {
                    Button("Simple Metallic Material") {
                        openWindow(id: "simple-metallic-material")
                    }
                    
                    Button("Simple Non-Metallic Material") {
                        openWindow(id: "simple-non-metallic-material")
                    }
                }
            }
            .padding()
            
            VStack {
                Text("Unlit Material")
                    .font(.extraLargeTitle2)
                Button("Unlit Material") {
                    openWindow(id: "unlit-material")
                }
            }
            .padding()
            
            VStack {
                Text("Occlusion Material")
                    .font(.extraLargeTitle2)
                Button("Occlusion Material") {
                    openWindow(id: "occlusion-material")
                }
            }
            .padding()
        }
    }
}

#Preview {
    MaterialsView()
}
