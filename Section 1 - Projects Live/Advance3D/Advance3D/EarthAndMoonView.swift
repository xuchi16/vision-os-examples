import RealityKit
import RealityKitContent
import SwiftUI

struct EarthAndMoonView: View {
    var body: some View {
        RealityView { content in
            guard let moon = try? await Entity(named: "Moon", in: realityKitContentBundle) else {
                print("No such moon model")
                return
            }
            moon.position = [0, 1.5, -1.5]
            moon.scale = moon.scale * 0.5

            moon.components.set(MoveComponent(expectCenter: [0, 1.5, -1.5]))

            content.add(moon)

            guard let earth = try? await Entity(named: "Earth", in: realityKitContentBundle) else {
                print("No such earth model")
                return
            }
            earth.position = [0, 1.5, -1.5]
            
            earth.scale *= 2
            content.add(earth)
        }
    }
}
