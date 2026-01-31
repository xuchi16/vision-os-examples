// Created by Chester for HelloVisionOS1 in 2025

import SwiftUI
import RealityKitContent
import RealityKit

struct SpaceView: View {
    var body: some View {
        Model3D(named: "NewScene", bundle: realityKitContentBundle)
    }
}

#Preview {
    SpaceView()
}
