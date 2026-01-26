// Created by Chester for Advance3D in 2025

import Foundation
import RealityKit

struct MoveSystem: System {
    init(scene: Scene) {}
    
    func update(context: SceneUpdateContext) {
        let entities = context.entities(
            matching: EntityQuery(where: .has(MoveComponent.self)),
            updatingSystemWhen: .rendering)
        
        for entity in entities {
            guard var moveComponent = entity.components[MoveComponent.self] else {
                return
            }
            
            let deltaAngle = moveComponent.speed * Float(context.deltaTime)
            moveComponent.angle += deltaAngle
            
            let center = moveComponent.center
            let angle = moveComponent.angle
            let radius = moveComponent.radius
            let x = cos(angle) * radius + center.x
            let z = sin(angle) * radius + center.z
            entity.position = [x, entity.position.y, z]
            
            entity.components.set(moveComponent)
        }
    }
}
