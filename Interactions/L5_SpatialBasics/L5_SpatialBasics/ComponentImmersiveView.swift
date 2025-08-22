//
//  ComponentImmersiveView.swift
//  L5_SpatialBasics
//
//  Created by xuchi on 2024/7/3.
//

import RealityKit
import SwiftUI

struct ComponentImmersiveView: View {
    var body: some View {
        RealityView { content in
            let ball = ModelEntity(
                mesh: .generateSphere(radius: 0.2),
                materials: [SimpleMaterial(color: .blue, roughness: 0.3, isMetallic: false)]
            )
            ball.position = [0, 1.0, -1.6]

            ball.components.set(GroundingShadowComponent(castsShadow: true))
            ball.components.set(InputTargetComponent(allowedInputTypes: [.indirect, .direct]))
            ball.generateCollisionShapes(recursive: true)
            
            content.add(ball)
            
            
            if let plane = try? await Entity(named: "Plane") {
                plane.position = [0.5, 1.0, -1.6]
                plane.castShadow()
                plane.components.set(InputTargetComponent(allowedInputTypes: [.indirect, .direct]))
                plane.generateCollisionShapes(recursive: true)
                
                content.add(plane)
            }
            
            let ball2 = ModelEntity(
                mesh: .generateSphere(radius: 0.2),
                materials: [SimpleMaterial(color: .red, isMetallic: false)]
            )
            ball2.position = [-0.5, 1.0, -1.6]
            
            ball2.components.set(GroundingShadowComponent(castsShadow: true))
            ball2.components.set(InputTargetComponent(allowedInputTypes: [.indirect, .direct]))
            ball2.collision = CollisionComponent(shapes: [.generateSphere(radius: 0.2)])
            ball2.components.set(HoverEffectComponent())

            content.add(ball2)
        }
        .gesture(
            DragGesture()
                .targetedToAnyEntity()
                .onChanged{ value in
                    let target = value.entity
                    target.position = value.convert(value.location3D, from: .local, to:target.parent!)
                }
        )
        
    }
}

#Preview {
    ComponentImmersiveView()
}
