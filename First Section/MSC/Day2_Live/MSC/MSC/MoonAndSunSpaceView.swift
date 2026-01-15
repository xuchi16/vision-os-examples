// Created by Chester for MSC in 2025

import SwiftUI
import RealityKit

struct MoonAndSunSpaceView: View {
    var body: some View {
        RealityView { content in
            guard let moon = try? await Entity(named: "Moon") else {
                print("No such model")
                return
            }

            moon.position = [-0.2, 1.8, -1.5]
            content.add(moon)

            guard let sun = try? await Entity(named: "Sun") else {
                return
            }
            sun.position = [0.2, 1.8, -1.5]
            sun.scale *= 2
            content.add(sun)
        }
    }
}

#Preview {
    MoonAndSunSpaceView()
}
