// Created by Chester for FlappyPlane in 2025

import Foundation
import RealityKit

struct PlaneComponent: Component {
    var start: Bool = false
}

class PlaneSystem: System {
    static let query = EntityQuery(where: .has(PlaneComponent.self))
    required init(scene: RealityKit.Scene) {}

    func update(context: SceneUpdateContext) {
        for plane in context.entities(matching: Self.query, updatingSystemWhen: .rendering) {
            guard let planeComponent = plane.components[PlaneComponent.self] else {
                print("No plane component")
                return
            }
            if !planeComponent.start {
                return
            }
            
            guard var pbc = plane.components[PhysicsBodyComponent.self],
                  let physicsEntity = plane as? HasPhysics
            else {
                return
            }

            let deltaTime = Float(context.deltaTime)

            // 每帧施加小的向下冲量，模拟慢速下落
            let downwardImpulse = -Constants.downImpulse * deltaTime // 用 deltaTime 归一化，确保帧率独立
            physicsEntity.applyLinearImpulse([0, downwardImpulse, 0], relativeTo: nil)

            // 可选：添加阻尼减缓整体速度
            pbc.linearDamping = 0.8

            plane.components.set(pbc)
        }
    }
}
