// Created by Chester for Materials in 2025

import RealityKit
import SwiftUI

struct PBRView: View {
    @Environment(AppModel.self) private var appModel

    var body: some View {
        VStack {
            Text("PBR Material")
                .font(.extraLargeTitle2)
                .padding()

            ToggleImmersiveSpaceButton()
                .padding()

            Text(appModel.pbrParams)
                .font(.title)
                .padding()
        }
    }
}

#Preview {
    PBRView()
}
