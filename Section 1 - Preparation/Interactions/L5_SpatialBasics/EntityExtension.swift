//
//  EntityExtension.swift
//  L5_SpatialBasics
//
//  Created by xuchi on 2024/7/3.
//

import RealityKit

extension Entity {
    func castShadow() {
        self.enumerateHierarchy { entity, stop in
            if entity is ModelEntity {
                entity.components.set(GroundingShadowComponent(castsShadow: true))
            }
        }
    }
    
    func enumerateHierarchy(_ body: (Entity, UnsafeMutablePointer<Bool>) -> Void) {
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
