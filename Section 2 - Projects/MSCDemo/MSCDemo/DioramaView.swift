// Created by Chester for MSCDemo in 2026

import RealityKit
import RealityKitContent
import SwiftUI

struct DioramaWindowView: View {
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        Button("打开沙盘") {
            openWindow(id: "diorama")
        }
    }
}

struct DioramaView: View {
    var body: some View {
        RealityView { content in
            guard let diorama = try? await Entity(named: "Diorama", in: realityKitContentBundle) else {
                return
            }
            content.add(diorama)
        }
    }
}

#Preview {
    DioramaView()
}
