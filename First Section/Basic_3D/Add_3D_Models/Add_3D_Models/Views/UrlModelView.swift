// Created by Chester for Add_3D_Models in 2025

import SwiftUI

import RealityKit
import SwiftUI

struct UrlModelView: View {
    var body: some View {
        let cakeUrl = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/pancakes/pancakes.usdz")!
        let cosmonautUrl = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/cosmonaut/CosmonautSuit_en.reality")!
        Model3D(url: cosmonautUrl) { model in
            model
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    UrlModelView()
}
