// Created by Chester for Materials in 2025

import SwiftUI

import RealityKit
import SwiftUI

struct SimpleMetallicMaterialView: View {
    var body: some View {
        RealityView { content, attachments in
            let simpleMetallicMaterial = SimpleMaterial(color: .red, isMetallic: true)
            let metallicCube = ModelEntity(
                mesh: .generateBox(size: 0.2, cornerRadius: 0.02),
                materials: [simpleMetallicMaterial])
            content.add(metallicCube)
            if let metallicTag = attachments.entity(for: "metallic") {
                metallicTag.position = [0, -0.12, 0.1]
                metallicCube.addChild(metallicTag)
            }
        } attachments: {
            Attachment(id: "metallic") {
                Text("Simple-Metallic")
                    .font(.title)
                    .padding()
                    .glassBackgroundEffect()
            }
        }
    }
}


#Preview {
    SimpleMetallicMaterialView()
}
