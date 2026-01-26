// Created by Chester for Advance3D in 2025

import RealityKit
import SwiftUI

struct RotateView: View {
    var body: some View {
        RealityView { content in
            let cube = ModelEntity(
                mesh: .generateBox(size: 0.2),
                materials: [SimpleMaterial(color: .blue, isMetallic: false)],
                collisionShape: .generateBox(size: [0.2, 0.2, 0.2]),
                mass: 0.0
            )
            cube.components.set(InputTargetComponent())
            cube.components.set(HoverEffectComponent())
            content.add(cube)
        }
        .toolbar {
            Text("Rotate Gesture")
                .font(.title)
                .padding()
        }
        .gesture(
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
    }
}


//let a: Float = 1.1 // 单精度
//let b: Double = 1.1 // 双精度

#Preview {
    RotateView()
}
