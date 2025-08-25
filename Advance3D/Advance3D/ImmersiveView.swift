// Created by Chester for Advance3D in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)

                // Put skybox here.  See example in World project available at
                // https://developer.apple.com/
            }
            
            guard let environment = try? await EnvironmentResource(named: "Macau") else {
                print("No environment resource found")
                return
            }
            
            let sphere = ModelEntity(
                mesh: .generateSphere(radius: 0.25),
                materials: [SimpleMaterial(color: .white, isMetallic: true)]
            )
            sphere.position = [0.6, 1.5, -2]
            content.add(sphere)
            
            sphere.components.set(ImageBasedLightComponent(source: .single(environment)))
            sphere.components.set(ImageBasedLightReceiverComponent(imageBasedLight: sphere))
            
            let sphere2 = ModelEntity(
                mesh: .generateSphere(radius: 0.25),
                materials: [SimpleMaterial(color: .white, isMetallic: false)]
            )
            sphere2.position = [-0.6, 1.5, -2]
            content.add(sphere2)
            sphere2.components.set(ImageBasedLightComponent(source: .single(environment)))
            sphere2.components.set(ImageBasedLightReceiverComponent(imageBasedLight: sphere2))
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
