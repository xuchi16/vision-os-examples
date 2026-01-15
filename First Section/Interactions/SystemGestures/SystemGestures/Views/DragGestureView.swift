// Created by Chester for SystemGestures in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct DragGestureView: View {
    @State private var cube: ModelEntity = .init()

    var body: some View {
        RealityView { content in
            cube = ModelEntity(
                mesh: .generateBox(size: 0.2, cornerRadius: 0.02),
                materials: [SimpleMaterial(color: .orange, isMetallic: false)]
            )
            cube.components.set(InputTargetComponent(allowedInputTypes: [.indirect, .direct]))
            cube.collision = CollisionComponent(shapes: [.generateBox(width: 0.2, height: 0.2, depth: 0.2)])
            content.add(cube)
        }
        .toolbar {
            Text("Drag Gesture")
                .font(.title)
                .padding()
        }
        .gesture(
            DragGesture()
                .targetedToEntity(cube)
                .onChanged { value in
                    cube.position = value.convert(value.location3D, from: .local, to: cube.parent!)
                }
        )
    }
}

#Preview {
    DragGestureView()
}
