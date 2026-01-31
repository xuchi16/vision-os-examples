// Created by Chester for HelloVisionOS1 in 2025

// 1. 引入了对于 RealityKit 和 RealityKitContent 的依赖
import RealityKit
import RealityKitContent
import SwiftUI

struct VolumeView: View {
    var body: some View {
        VStack {
            // 声明了 Model3D 里的模型
            Model3D(named: "NewScene", bundle: realityKitContentBundle)
//            Model3D(named: "Scene")
            
            Text("Hello Volume")
        }
    }
}

#Preview {
    VolumeView()
}
