// Created by Chester for MSCWorld in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct PortalView: View {
    var body: some View {
        RealityView { content in
            // 创建世界
            let world = makeWorld()
            world.position = [0, 1.5, -2]
            content.add(world)
            
            // 创建 Portal
            let portal = makePortal(targetWorld: world)
            portal.position = [0, 1.5, -2]
            content.add(portal)
        }
    }
    
    func makePortal(targetWorld: Entity) -> Entity {
        let portal = ModelEntity(
            mesh: .generatePlane(width: 2.0, height: 1.0, cornerRadius: 0.1),
            materials: [PortalMaterial()]
        )
        
        // 设置 Portal 支持 crossing
        // ========================================================
        var portalComponent = PortalComponent(target: targetWorld)
        portalComponent.clippingMode = .disabled
        portalComponent.crossingMode = .plane(.positiveZ)
        
        portal.components.set(portalComponent)
        // ========================================================
        
        return portal
    }
    
    func makeWorld() -> Entity {
        let world = Entity()
        world.components.set(WorldComponent())
        
        let container = Entity()
        world.addChild(container)
        
        // 设置 Entity 支持 Crossing
        // ========================================================
        container.components.set(PortalCrossingComponent())
        let movement = generateMovement(start: Point3D(x: 0, y: 0, z: -3), end: Point3D(x: 0, y: 0, z: 1.5))
        container.playAnimation(movement)
        // ========================================================
        
        if let plane = try? Entity.load(named: "plane", in: realityKitContentBundle) {
            plane.scale *= 0.1
            plane.playAnimationLoop()
            container.addChild(plane)
        }
        
        
        return world
    }
    
    func generateMovement(start: Point3D, end: Point3D) -> AnimationResource {
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
}
