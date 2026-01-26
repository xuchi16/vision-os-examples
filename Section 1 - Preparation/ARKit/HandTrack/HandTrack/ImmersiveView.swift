//
//  ImmersiveView.swift
//  HandTrack
//
//  Created by xuchi on 2024/7/16.
//

import RealityKit
import RealityKitContent
import SwiftUI

struct ImmersiveView: View {
    @Environment(AppModel.self) var model

    var body: some View {
        RealityView { content in
            content.add(model.setupContentEntity())
        }
        .task {
            await model.runSession()
        }
        .task {
            await model.processHandUpdates()
        }
    }
}
