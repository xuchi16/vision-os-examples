// Created by Chester for Advance3D in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)
                
                guard let environment = try? await EnvironmentResource(named: "Macau") else {
                    print("No such environment texture")
                    return
                }
                
                let sphere = ModelEntity(
                    mesh: .generateSphere(radius: 0.2),
                    materials: [SimpleMaterial(color: .white, isMetallic: true)]
                )
                sphere.position = [0, 1.5, -1.5]
                sphere.components.set(ImageBasedLightComponent(source: .single(environment)))
                sphere.components.set(ImageBasedLightReceiverComponent(imageBasedLight: sphere))
                content.add(sphere)
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
