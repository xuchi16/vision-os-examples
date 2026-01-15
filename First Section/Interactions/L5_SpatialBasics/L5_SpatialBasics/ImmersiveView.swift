//
//  ImmersiveView.swift
//  L5_SpatialBasics
//
//  Created by xuchi on 2024/7/3.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    var body: some View {
        RealityView { content in
            if let plane = try? await Entity(named: "Plane") {
                plane.position = [0, 1.5, -1.5]
                
                let pitch = Transform(pitch: degreesToRadians(30)).matrix
                let yaw = Transform(yaw: degreesToRadians(30)).matrix
                let roll = Transform(roll: degreesToRadians(30)).matrix
                plane.transform.matrix *= roll
                
                plane.transform.rotation = simd_quatf(angle: .pi / 6, axis: [0, 1, 0])
                content.add(plane)
            }
            
//            content.add(rotateABall())
//            content.add(rotateAPoint())
            content.add(interpolateBetweenPoints())
        }
    }
    
    func rotateABall() -> Entity{
        let entity = Entity()
        entity.position = [0, 1.5, -1.5]
        
        let radius: Float = 0.2
        let sphere = ModelEntity(
            mesh: .generateSphere(radius: radius),
            materials: [SimpleMaterial(color: .gray, roughness: 0.4, isMetallic: false)]
        )
        entity.addChild(sphere)
        
        let originVector = simd_float3(x: 0, y: 0, z: radius)
        let point0 = ModelEntity(
            mesh: .generateSphere(radius: 0.02),
            materials: [SimpleMaterial(color: .red, roughness: 0.4, isMetallic: false)]
        )
        point0.position = originVector
        entity.addChild(point0)
        
        let quaternion = simd_quatf(angle: degreesToRadians(-60),
                                    axis: simd_float3(x: 1,
                                                      y: 0,
                                                      z: 0))
        entity.transform.rotation = quaternion
        return entity
    }
    
    
    func rotateAPoint() -> Entity {
        let entity = Entity()
        entity.position = [0, 1.5, -1.5]
        
        let radius: Float = 0.2
        let sphere = ModelEntity(
            mesh: .generateSphere(radius: radius),
            materials: [SimpleMaterial(color: .gray, roughness: 0.4, isMetallic: false)]
        )
        entity.addChild(sphere)
        
        
        let originVector = simd_float3(x: 0, y: 0, z: radius)
        let quaternion = simd_quatf(angle: degreesToRadians(-60),
                                    axis: simd_float3(x: 1,
                                                      y: 0,
                                                      z: 0))
        let rotatedVector = quaternion.act(originVector)
        
        
        let point0 = ModelEntity(
            mesh: .generateSphere(radius: 0.02),
            materials: [SimpleMaterial(color: .red, roughness: 0.4, isMetallic: false)]
        )
        point0.position = originVector
        entity.addChild(point0)
        
        let point1 = ModelEntity(
            mesh: .generateSphere(radius: 0.02),
            materials: [SimpleMaterial(color: .yellow, roughness: 0.4, isMetallic: false)]
        )
        point1.position = rotatedVector
        entity.addChild(point1)
        return entity
    }
    
    func interpolateBetweenPoints() -> Entity {
        let entity = Entity()
        entity.position = [0, 1.5, -1.5]
        let radius: Float = 0.2
        let sphere = ModelEntity(
            mesh: .generateSphere(radius: radius),
            materials: [SimpleMaterial(color: .gray.withAlphaComponent(0.8), roughness: 0.4, isMetallic: false)]
        )
        entity.addChild(sphere)
        
        let origin = simd_float3(0, 0, radius)
        
        let q0 = simd_quatf(angle: .pi / 6,
                            axis: simd_normalize(simd_float3(x: 0,
                                                             y: -1,
                                                             z: 0)))
        let u0 = simd_act(q0, origin)
        
        
        let q1 = simd_quatf(angle: .pi / 6,
                            axis: simd_normalize(simd_float3(x: -1,
                                                             y: 1,
                                                             z: 0)))
        let u1 = simd_act(q1, origin)
        
        
        let q2 = simd_quatf(angle: .pi / 20,
                            axis: simd_normalize(simd_float3(x: 1,
                                                             y: 0,
                                                             z: -1)))
        
        let u2 = simd_act(q2, origin)
        
        let point0 = ModelEntity(
            mesh: .generateSphere(radius: 0.01),
            materials: [SimpleMaterial(color: .red, roughness: 0.4, isMetallic: false)]
        )
        entity.addChild(point0)
        point0.position = u0
        
        let point1 = ModelEntity(
            mesh: .generateSphere(radius: 0.01),
            materials: [SimpleMaterial(color: .yellow, roughness: 0.4, isMetallic: false)]
        )
        entity.addChild(point1)
        point1.position = u1
        
        let point2 = ModelEntity(
            mesh: .generateSphere(radius: 0.01),
            materials: [SimpleMaterial(color: .blue, roughness: 0.4, isMetallic: false)]
        )
        entity.addChild(point2)
        point2.position = u2
        
        
        for t: Float in stride(from: 0, to: 1, by: 0.001) {
            let q = simd_slerp(q0, q1, t)
            let p = ModelEntity(
                mesh: .generateSphere(radius: 0.002),
                materials: [SimpleMaterial(color: .red, roughness: 0.4, isMetallic: false)]
            )
            entity.addChild(p)
            p.position = q.act(origin)
        }
        
        for t: Float in stride(from: 0, to: 1, by: 0.001) {
            let q = simd_slerp_longest(q1, q2, t)
            let p = ModelEntity(
                mesh: .generateSphere(radius: 0.002),
                materials: [SimpleMaterial(color: .yellow, roughness: 0.4, isMetallic: false)]
            )
            entity.addChild(p)
            p.position = q.act(origin)
        }
        return entity
    }
    
    func degreesToRadians(_ degree: Float) -> Float {
        return degree * .pi / 180
    }
    
    func scaleY(_ entity: Entity) {
        let scale = entity.transform.scale
        entity.transform.scale = [scale.x, scale.y * 4, scale.z]
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
