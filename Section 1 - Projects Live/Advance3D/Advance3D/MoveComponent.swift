// Created by Chester for Advance3D in 2025

import Foundation
import RealityKit

struct MoveComponent: Component {
    var center: SIMD3<Float>
    var radius: Float = 0.4
    var speed: Float = 2.0
    
    // 保存状态
    var angle: Float = 0.0
    
    init(expectCenter: SIMD3<Float>) {
        center = expectCenter
    }
}
