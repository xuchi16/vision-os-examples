// Created by Chester for HelloVisionOS1 in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct ContentView: View {
    // 从工具箱里拿到 openWindow 扳手
    @Environment(\.openWindow) var openWindow
    // 从工具箱里拿到 openImmersiveSpace 扳手
    @Environment(\.openImmersiveSpace) var openSpace
    // 获取关闭的扳手
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            // Model3D(named: "Scene", bundle: realityKitContentBundle)

            Text("你好 Vision Pro")
                .font(.title)
                .padding()

            Button {
                Task {
                    await openSpace(id: "space")
                    openWindow(id: "window")
                    openWindow(id: "volume")
                }
            } label: {
                Text("OPEN ALL")
            }
            
            
            Button {
                // 通过扳手打开Space
                Task {
                    await openSpace(id: "space")
                }
            } label: {
                Text("Open Space")
            }

            Button {
                // 通过扳手关闭空间
                Task {
                    await dismissImmersiveSpace()
                }
            } label: {
                Text("Close Space")
            }

            Button {
                // 行为
                // 通过扳手打开窗口
                // 窗口ID必须是刚刚定义的ID
                openWindow(id: "window")
            } label: {
                // 名称
                Text("Open Window 2026")
            }

            // VOLUME!!
            Button {
                print("Hello")
                openWindow(id: "111")
            } label: {
                Text("Open Volume")
            }

            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
