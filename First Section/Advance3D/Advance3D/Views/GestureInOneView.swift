// Created by Chester for SystemGestures in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct GestureInOneView: View {
    @State private var cube: ModelEntity = .init()
    @State private var entity = Entity()

    var body: some View {
        RealityView { content in
            self.cube = ModelEntity(
                mesh: .generateBox(size: 0.2, cornerRadius: 0.02),
                materials: [SimpleMaterial(color: .white, isMetallic: false)]
            )
            self.cube.components.set(InputTargetComponent(allowedInputTypes: [.indirect, .direct]))
            self.cube.collision = CollisionComponent(shapes: [.generateBox(width: 0.2, height: 0.2, depth: 0.2)])
            self.entity.addChild(self.cube)
            content.add(self.entity)
        }
        .toolbar {
            Text("All in one")
                .font(.title)
                .padding()
        }
        .gesture(
            DragGesture()
                .targetedToEntity(cube)
                .onChanged { value in
                    self.cube.position = value.convert(value.location3D, from: .local, to: self.cube.parent!)
                }
        )
        .simultaneousGesture(
            RotateGesture3D()
                .targetedToEntity(cube)
                .onChanged { value in
                    let quatd = value.rotation.quaternion
                    let quatf = simd_quatf(ix: Float(quatd.imag.x), iy: Float(quatd.imag.y), iz: Float(quatd.imag.z), r: Float(quatd.real))
                    self.cube.transform.rotation = quatf
                }
        )
        .simultaneousGesture(
            MagnifyGesture()
                .targetedToEntity(cube)
                .onChanged { value in
                    let scale = Float(value.gestureValue.magnification)
                    self.cube.transform.scale = SIMD3<Float>(repeating: scale)
                }
        )
    }
}

#Preview {
    GestureInOneView()
}
