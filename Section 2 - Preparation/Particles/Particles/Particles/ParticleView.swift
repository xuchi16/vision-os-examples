// Created by Chester for Particles in 2026

import RealityKit
import SwiftUI

struct ParticleView: View {
    var body: some View {
        RealityView { content in
            let snowEntity = Entity()
            var snowEmitterComponent = ParticleEmitterComponent()
            snowEmitterComponent = .Presets.snow
            snowEntity.components.set(snowEmitterComponent)
            snowEntity.position = [-0.2, 0, 0]
            content.add(snowEntity)

            let entity = Entity()
            var emitterComponent = ParticleEmitterComponent()
            emitterComponent = .Presets.snow
            emitterComponent.speed = 0.2
            emitterComponent.mainEmitter.color = .constant(.single(.red))
            entity.components.set(emitterComponent)
            entity.position = [0.2, 0, 0]
            content.add(entity)
        }
    }
}

#Preview {
    ParticleView()
}
