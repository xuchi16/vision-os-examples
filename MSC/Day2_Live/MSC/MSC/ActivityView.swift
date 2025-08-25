// Created by Chester for MSC in 2025

import SwiftUI
import RealityKit

struct ActivityView: View {
    @Environment(\.openWindow) var openWindow
    @Environment(\.openImmersiveSpace) var openSpace
    
    var body: some View {
        VStack {
            Button {
                openWindow(id: "mas")
            } label: {
                Text("通过 RealityView 加载模型")
            }
            
            Button {
                Task {
                    await openSpace(id: "masSpace")
                }
            } label: {
                Text("打开空间")
            }
        }
    }
}

#Preview {
    ActivityView()
}
