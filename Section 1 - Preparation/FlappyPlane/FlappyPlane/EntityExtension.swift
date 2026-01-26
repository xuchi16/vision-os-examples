// Created by Chester for FlappyPlane in 2025

import RealityKit
import RealityKitContent

extension Entity {
    static func makePlane() async throws -> Entity {
        guard let planePrefab = try? await Entity(named: "PlanePrefab", in: realityKitContentBundle),
              let plane = planePrefab.findEntity(named: "plane")
        else {
            return Entity()
        }
        plane.components.set(PlaneComponent())
        
        return plane
    }
    
    static func makeCloud() async throws -> ModelEntity {
        let cloud = ModelEntity()
        cloud.name = "Cloud"
        
        let cloudModel = try await Entity(named: "cloud", in: realityKitContentBundle)
        cloudModel.name = "CloudModel"
        cloud.addChild(cloudModel)
        
        return cloud
    }
    
    func playAnimationWithInifiniteLoop() {
        for animation in self.availableAnimations {
            let repeatition = animation.repeat(count: .max)
            let _ = self.playAnimation(repeatition)
            return
        }
    }
    
    func castShadow() {
        self.enumerateHierarchy { entity, _ in
            if entity is ModelEntity {
                entity.components.set(GroundingShadowComponent(castsShadow: true))
            }
        }
    }
    
    private func enumerateHierarchy(_ body: (Entity, UnsafeMutablePointer<Bool>) -> Void) {
        var stop = false

        func enumerate(_ body: (Entity, UnsafeMutablePointer<Bool>) -> Void) {
            guard !stop else {
                return
            }

            body(self, &stop)
            
            for child in children {
                guard !stop else {
                    break
                }
                child.enumerateHierarchy(body)
            }
        }
        enumerate(body)
    }
}
