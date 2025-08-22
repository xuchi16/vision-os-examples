// Created by Chester for Materials in 2025

import RealityKit
import SwiftUI

struct UnlitMaterialView: View {
    var body: some View {
        RealityView { content, attachments in
            let unlitMaterial = UnlitMaterial(color: .red)
            let cube = ModelEntity(mesh: .generateBox(size: 0.2, cornerRadius: 0.02), materials: [unlitMaterial])
            content.add(cube)
            if let tag = attachments.entity(for: "unlit") {
                tag.position = [0, -0.12, 0.1]
                cube.addChild(tag)
            }
        } attachments: {
            Attachment(id: "unlit") {
                Text("Unlit")
                    .font(.title)
                    .padding()
                    .glassBackgroundEffect()
                
            }
        }
    }
}

#Preview {
    UnlitMaterialView()
}
