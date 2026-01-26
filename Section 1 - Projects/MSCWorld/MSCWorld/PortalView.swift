// Created by Chester for MSCWorld in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct PortalView: View {
    var body: some View {
        RealityView { content in
            let world = makeWorld()
            let portal = makePortal(world: world)

            world.position = [0, 1.5, -2]
            portal.position = [0, 1.5, -2]

            content.add(world)
            content.add(portal)
        }
    }

    func makeWorld() -> Entity {
        let world = Entity()
        world.components.set(WorldComponent())

        if let plane = try? Entity.load(named: "plane", in: realityKitContentBundle) {
            let container = Entity()
            plane.scale *= 0.03
            plane.playAnimationWithInifiniteLoop()
            container.addChild(plane)
            // 要让这个物体支持穿越
            container.components.set(PortalCrossingComponent())

            let movement = generateMovement(
                start: Point3D(x: 0.0, y: 0.0, z: -3),
                end: Point3D(x: 0.0, y: 0.0, z: 1.5))
            container.playAnimation(movement,
                                    transitionDuration: 1.0,
                                    startsPaused: false)

            world.addChild(container)
        }

        return world
    }

    func makePortal(world: Entity) -> Entity {
        let portal = ModelEntity(mesh: .generatePlane(width: 2.0, height: 1.0, cornerRadius: 0.1),
                                 materials: [PortalMaterial()])
        var portalComponent = PortalComponent(target: world)
        portalComponent.clippingMode = .disabled
        portalComponent.crossingMode = .plane(.positiveZ)

        portal.components.set(portalComponent)
        return portal
    }
}

private func generateMovement(start: Point3D, end: Point3D) -> AnimationResource {
    let line = FromToByAnimation<Transform>(
        name: "line",
        from: .init(scale: .init(repeating: 1), translation: simd_float(start.vector)),
        to: .init(scale: .init(repeating: 1), translation: simd_float(end.vector)),
        duration: 5.0,
        timing: .linear,
        bindTarget: .transform
    )

    let animation = try! AnimationResource
        .generate(with: line)
    return animation
}

#Preview {
    PortalView()
}
