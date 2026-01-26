// Created by Chester for Advance3D in 2025

import RealityKit
import SwiftUI

struct MagnifyView: View {
    var body: some View {
        RealityView { content in
            let cube = ModelEntity(
                mesh: .generateBox(size: 0.2),
                materials: [SimpleMaterial(color: .green, isMetallic: false)],
                collisionShape: .generateBox(size: [0.2, 0.2, 0.2]),
                mass: 0.0)
            
            cube.components.set(InputTargetComponent())
            
            // 优化
            cube.components.set(HoverEffectComponent())
            
            content.add(cube)
        }
        .toolbar {
            Text("Magnify Gesture")
                .font(.title)
                .padding()
        }
        .gesture (
            MagnifyGesture()
                .targetedToAnyEntity()
                .onChanged { value in
                    let scale = Float(value.gestureValue.magnification)
                    value.entity.scale = [scale, scale, scale]
                }
        )
    }
}

#Preview {
    MagnifyView()
}
