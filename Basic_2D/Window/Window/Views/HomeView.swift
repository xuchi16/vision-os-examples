// Created by Chester for Window in 2025

import SwiftUI
#if os(visionOS)
import RealityKit
import RealityKitContent
#endif


struct HomeView: View {
    
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    @State private var isIntroWindowOpened = false
    
    var body: some View {
        VStack {
#if os(visionOS)
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)
            
            Text("Hello, world!")
                .font(.extraLargeTitle)
            
            Text("Hello, world!")
                .font(.extraLargeTitle2)
#else
            
            Text("Hello, world!")
                .font(.title)
#endif
            Button {
                openWindow(id: "instructor")
            } label: {
                Text("Instructor introduction")
            }
            .font(.title)
            .padding()
            
            Toggle("Instructor instroduction", isOn: $isIntroWindowOpened)
                .onChange(of: isIntroWindowOpened) { _, newVal in
                    if newVal {
                        openWindow(id: "instructor")
                    } else {
                        dismissWindow(id: "instructor")
                    }
                }
                .font(.title)
                .padding()
                .toggleStyle(.button)
        }
        .padding()
    }
}
