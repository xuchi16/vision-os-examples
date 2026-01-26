// Created by Chester for Materials in 2025

import RealityKit
import SwiftUI

struct SimpleNonMetallicMaterialView: View {
    var body: some View {
        RealityView { content, attachments in
            let simpleNonMetallicMaterial = SimpleMaterial(color: .red, isMetallic: false)
            let nonMetallicCube = ModelEntity(
                mesh: .generateBox(size: 0.2, cornerRadius: 0.02),
                materials: [simpleNonMetallicMaterial])
            content.add(nonMetallicCube)
            if let nonMetallicTag = attachments.entity(for: "non-metallic") {
                nonMetallicTag.position = [0, -0.12, 0.1]
                nonMetallicCube.addChild(nonMetallicTag)
            }
        } attachments: {

            Attachment(id: "non-metallic") {
                Text("Simple-Non-Metallic")
                    .font(.title)
                    .padding()
                    .glassBackgroundEffect()
            }
        }
    }
}

#Preview {
    SimpleNonMetallicMaterialView()
}
