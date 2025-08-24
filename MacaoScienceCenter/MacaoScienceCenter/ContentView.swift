// Created by Chester for MacaoScienceCenter in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        TabView {
            NewsView()
                .tabItem {
                    Label("最新消息", systemImage: "newspaper")
                }
                .tag(1)
            
            ProgramView()
                .tabItem {
                    Label("节目日志", systemImage: "calendar")
                }
                .tag(2)
            
            Text("活动推介")
                .tabItem {
                    Label("活动推介", systemImage: "megaphone")
                }
                .tag(3)
            
            Text("球幕电影")
                .tabItem {
                    Label("球幕电影", systemImage: "circle.grid.cross")
                }
                .tag(4)
            
            Text("展览中心")
                .tabItem {
                    Label("展览中心", systemImage: "rectangle.grid.2x2")
                }
                .tag(5)
            
            AboutView()
                .tabItem {
                    Label("关于我们", systemImage: "info.circle")
                }
                .tag(6)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
