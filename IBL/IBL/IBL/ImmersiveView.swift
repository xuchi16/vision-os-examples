// Created by Chester for IBL in 2025

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @State private var skybox = Entity()

    var body: some View {
        RealityView { content in
            // Object
            guard let environment = try? await EnvironmentResource(named: "shanghai_bund") else {
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

            
            // Skybox
            guard let resource = try? await TextureResource(named: "shanghai_bund") else {
                print("No texture resource found")
                return
            }
            var material = UnlitMaterial()
            material.color = .init(texture: .init(resource))
            
            skybox.components.set(ModelComponent(
                mesh: .generateSphere(radius: 1000),
                materials: [material]
            ))
            
            // Reverse x to let the picture applied to the inner side of skybox
            skybox.scale = .init(x: -1 * abs(skybox.scale.x), y: skybox.scale.y, z: skybox.scale.z)
            
            content.add(skybox)
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
