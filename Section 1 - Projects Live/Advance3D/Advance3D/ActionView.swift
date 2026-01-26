// Created by Chester for Advance3D in 2025

import RealityKit
import SwiftUI

struct ActionView: View {
    var body: some View {
        RealityView { content in
            let entity = Entity()

            let modelComponent = ModelComponent(
                mesh: MeshResource.generateBox(size: 0.2, cornerRadius: 0.01),
                materials: [SimpleMaterial(color: .white, isMetallic: false)]
            )
            entity.components.set(modelComponent)

            // 操作相关的 Components
            entity.components.set(InputTargetComponent(allowedInputTypes: .indirect))
            entity.components.set(CollisionComponent(shapes: [.generateBox(size: [0.3, 0.3, 0.3])], isStatic: false))
            // 体验优化相关的 Components
            entity.components.set(HoverEffectComponent())
            entity.components.set(GroundingShadowComponent(castsShadow: true))

            entity.position = [0, 1.5, -1.5]
            content.add(entity)
        }
        // 添加手势
        .gesture(
            DragGesture()
                .targetedToAnyEntity()
                .onChanged { value in
                    value.entity.position = value.convert(value.location3D, from: .local, to: value.entity.parent!)
                }
        )
        .simultaneousGesture(
            RotateGesture3D()
                .targetedToAnyEntity()
                .onChanged { value in
                    let quatd = value.rotation.quaternion
                    let quatf = simd_quatf(
                        ix: Float(quatd.imag.x),
                        iy: Float(quatd.imag.y),
                        iz: Float(-quatd.imag.z),
                        r: Float(quatd.real)
                    )
                    value.entity.transform.rotation = quatf
                }
        )
        .simultaneousGesture(
            MagnifyGesture()
                .targetedToAnyEntity()
                .onChanged { value in
                    let scale = Float(value.gestureValue.magnification)
                    value.entity.scale = [scale, scale, scale]
                }
        )
        .simultaneousGesture(
            SpatialTapGesture()
                .targetedToAnyEntity()
                .onEnded { value in
                    print("Event location: \(value.location3D)")
                    changeColor(entity: value.entity)
                    let currentScale = value.entity.scale
                    value.entity.scale = [currentScale.x, currentScale.y * 1.2, currentScale.z]
                }
        )
    }
}

let colors: [SimpleMaterial.Color] = [.gray, .blue, .red, .white, .purple, .green]

func changeColor(entity: Entity) {
    guard let color = colors.randomElement() else {
        return
    }
    guard var modelComponent = entity.components[ModelComponent.self] else {
        return
    }
    modelComponent.materials = [SimpleMaterial(color: color, isMetallic: false)]
    entity.components.set(modelComponent)
}
