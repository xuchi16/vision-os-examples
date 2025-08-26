// Created by Chester for Advance3D in 2025

import Foundation
import RealityKit

public struct MoveSystem: System {
    static let moveQuery = EntityQuery(where: .has(MoveComponent.self))
    
    public init(scene: Scene) {
    }
    
    public func update(context: SceneUpdateContext) {
        let entities = context.entities(matching: Self.moveQuery, updatingSystemWhen: .rendering)
        for entity in entities {
            guard var moveComponent = entity.components[MoveComponent.self] else {
                continue
            }
            
            // Update angle
            moveComponent.angle += moveComponent.speed * Float(context.deltaTime)
            
            // Calculate position
            let center = moveComponent.center
            let x = cos(moveComponent.angle) * moveComponent.radius + center.x
            let z = sin(moveComponent.angle) * moveComponent.radius + center.z
            entity.position = SIMD3<Float>(x, entity.position.y, z)
            
            entity.components[MoveComponent.self] = moveComponent
            
        }
    }
}
