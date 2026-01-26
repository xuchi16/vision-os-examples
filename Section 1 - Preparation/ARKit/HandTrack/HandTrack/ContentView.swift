//
//  ContentView.swift
//  HandTrack
//
//  Created by xuchi on 2024/7/16.
//

import RealityKit
import RealityKitContent
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hand Track")
                .font(.title)

            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
