// Created by Chester for MSCWorld in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            let cube = ModelEntity(
                mesh: .generateBox(size: 0.1),
                materials: [SimpleMaterial(color: .blue, isMetallic: false)],
                collisionShape: .generateBox(size: [0.1, 0.1, 0.1]),
                mass: 1.0
            )
            // ========================================================
            cube.components.set(InputTargetComponent())
            cube.components.set(HoverEffectComponent())
            cube.components.set(GroundingShadowComponent(castsShadow: true))
            // ========================================================
            
            cube.position = [0, 0.5, -1.5]
            content.add(cube)
            
            let floor = ModelEntity(
                mesh: .generateBox(width: 0.0, height: 0.05, depth: 0.0),
                materials: [SimpleMaterial(color: .gray, isMetallic: false)],
                collisionShape: .generateBox(size: [10, 0.05, 10]),
                mass: 0.0
            )
            content.add(floor)
        }
        // =========================OPTIONAL===============================
        .gesture(
            DragGesture()
                .targetedToAnyEntity()
                .onChanged { value in
                    value.entity.position = value.convert(value.location3D, from: .local, to: value.entity.parent!)
                }
        )
        .simultaneousGesture(
            SpatialTapGesture()
                .targetedToAnyEntity()
                .onEnded { value in
                    print("Clicked")
                    addTorque(entity: value.entity, strength: 4)
                }
        )
    }
    
    func addForce(entity: Entity, strength: Float) {
        if let modelEntity = entity as? ModelEntity {
            modelEntity.addForce([0, strength, 0], relativeTo: nil)
        }
    }
    
    func addImpulse(entity: Entity, strength: Float) {
        if let modelEntity = entity as? ModelEntity {
            modelEntity.applyLinearImpulse([0, strength, 0], relativeTo: nil)
        }
    }
    
    func addTorque(entity: Entity, strength: Float) {
        if let modelEntity = entity as? ModelEntity {
            modelEntity.addTorque([0, strength, 0], relativeTo: nil)
        }
    }
    
}
