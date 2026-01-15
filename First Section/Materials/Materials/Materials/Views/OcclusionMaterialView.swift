// Created by Chester for Materials in 2025

import RealityKit
import SwiftUI

struct OcclusionMaterialView: View {
    var body: some View {
        RealityView { content, attachments in
            let simpleMaterial = SimpleMaterial(color: .red, roughness: 0, isMetallic: false)
            let cube = ModelEntity(mesh: .generateBox(size: 0.2, cornerRadius: 0.02), materials: [simpleMaterial])
            let occlusionCube = ModelEntity(
                mesh: .generateBox(width: 0.1, height: 0.1, depth: 0.22),
                materials: [OcclusionMaterial()]
            )
            content.add(cube)
            content.add(occlusionCube)
            
            if let tag = attachments.entity(for: "occlusion") {
                tag.position = [0, -0.12, 0.1]
                cube.addChild(tag)
            }
        } attachments: {
            Attachment(id: "occlusion") {
                Text("Occlusion")
                    .font(.title)
                    .padding()
                    .glassBackgroundEffect()
                
            }
        }
    }
}

#Preview {
    OcclusionMaterialView()
}
