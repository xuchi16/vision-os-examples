// Created by Chester for MSCWorld in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct PlaneView: View {
    var body: some View {
        RealityView { content in
            if let plane = try? await Entity(named: "plane", in: realityKitContentBundle) {
                // 如果可以成功加载小飞机模型，则进行处理
                plane.scale *= 0.05
                plane.position = [0, 0.1, 0]
                plane.playAnimationLoop()
                content.add(plane)
            }

            if let cloud = try? await Entity(named: "cloud", in: realityKitContentBundle) {
                cloud.scale *= 0.05
                cloud.position = [0.2, 0.2, -0.1]
                content.add(cloud)
            }

            if let tree = try? await Entity(named: "tree", in: realityKitContentBundle) {
                tree.scale *= 0.1
                tree.position = [-0.2, -0.1, 0.2]
                content.add(tree)
            }

            let cube = ModelEntity(
                mesh: .generateBox(width: 0.8, height: 0.01, depth: 0.8),
                materials: [SimpleMaterial(color: .white, isMetallic: false)]
            )
            cube.position = [0, -0.3, 0]
            content.add(cube)
        }
    }
}
