// Created by Chester for MSC in 2025

import RealityKit
import RealityKitContent
import SwiftUI

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
            
            ActivityView()
                .tabItem {
                    Label("活动推介", systemImage: "megaphone")
                }
                .tag(3)
            
            Text("最新消息具体内容")
                .tabItem {
                    Label("球幕电影", systemImage: "circle.grid.cross")
                }
                .tag(4)
            
            Text("最新消息具体内容")
                .tabItem {
                    Label("展览中心", systemImage: "rectangle.grid.2x2")
                }
                .tag(5)
            
            Text("最新消息具体内容")
                .tabItem {
                    Label("推荐视频", systemImage: "video")
                }
                .tag(6)
            
            AboutView()
                .tabItem {
                    Label("本馆介绍", systemImage: "info.circle")
                }
                .tag(7)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
