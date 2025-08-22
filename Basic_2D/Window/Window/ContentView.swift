// Created by Chester for Window in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State var currentTag = "home"
    
    var body: some View {
        TabView(selection: $currentTag) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag("home")
            
            SectionView()
                .tabItem {
                    Label("Sections", systemImage: "list.triangle")
                }
                .tag("sections")
            
            ProjectView()
                .tabItem {
                    Label("Sections", systemImage: "macbook.and.visionpro")
                }
                .tag("projects")
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
