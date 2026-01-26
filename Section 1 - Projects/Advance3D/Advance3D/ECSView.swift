// Created by Chester for Advance3D in 2025

import RealityKit
import RealityKitContent
import SwiftUI

struct ECSView: View {
    var body: some View {
        RealityView { content in
            guard let moon = try? await Entity(named: "Moon", in: realityKitContentBundle) else {
                print("No such model")
                return
            }

            moon.position = [0, 1.5, -1.5]
            moon.scale *= 0.5
            moon.components.set(MoveComponent(position: [0, 1.5, -1.5]))
            content.add(moon)

            guard let earth = try? await Entity(named: "Earth", in: realityKitContentBundle) else {
                print("No such model")
                return
            }
            earth.position = [0, 1.5, -1.5]
            earth.scale *= 2
            content.add(earth)
        }
    }
}
