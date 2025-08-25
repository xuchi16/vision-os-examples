// Created by Chester for Advance3D in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct ECSView: View {
    private let radius: Float = 0.2
    private let attachmentOffset: SIMD3<Float> = [0, -0.3, 0]
    private let attachmentFontSize = 50.0
    private let attachmentPadding = 40.0
    
    @State var programmaticEntity = Entity()
    @State var dragEntity = Entity()

    var body: some View {
        RealityView { content, attachments in
            // Drag movement
            dragEntity = ModelEntity(
                mesh: .generateSphere(radius: radius),
                materials: [SimpleMaterial(color: .blue, isMetallic: false)],
                collisionShape: .generateSphere(radius: radius),
                mass: 0.0
            )
            dragEntity.position = SIMD3(x: -0.6, y: 1.5, z: -1.5)
            dragEntity.components.set(InputTargetComponent(allowedInputTypes: .indirect))
            dragEntity.components.set(HoverEffectComponent())
            dragEntity.components.set(GroundingShadowComponent(castsShadow: true))
            content.add(dragEntity)
            
            if let attachment = attachments.entity(for: "dragMove") {
                attachment.position = attachmentOffset
                dragEntity.addChild(attachment)
            }
            
            // Programmatic movement
            let initPosition = SIMD3<Float>(x: 0.6, y: 1.5, z: -1.5)
            let moveComponent = MoveComponent(position: initPosition)
            programmaticEntity = ModelEntity(
                mesh: .generateSphere(radius: radius),
                materials: [SimpleMaterial(color: .red, isMetallic: false)]
            )
            programmaticEntity.position = initPosition
            programmaticEntity.components[MoveComponent.self] = moveComponent
            content.add(programmaticEntity)
            
            if let attachment = attachments.entity(for: "progMove") {
                attachment.position = attachmentOffset
                programmaticEntity.addChild(attachment)
            }
        } attachments: {
            Attachment(id: "dragMove") {
                Text("Drag Movement")
                    .font(.system(size: attachmentFontSize))
                    .padding(attachmentPadding)
                    .glassBackgroundEffect()
            }
            
            Attachment(id: "progMove") {
                Text("Programmatic Movement")
                    .font(.system(size: attachmentFontSize))
                    .padding(attachmentPadding)
                    .glassBackgroundEffect()
            }
        }
        .gesture(
            DragGesture()
                .targetedToAnyEntity()
                .onChanged { value in
                    dragEntity.position =
                        value.convert(value.location3D, from: .local, to: dragEntity.parent!)
                }
        )
    }
}
