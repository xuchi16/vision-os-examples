// Created by Chester for Advance3D in 2025

import Foundation
import RealityKit

public struct MoveComponent: Component {
    public var speed: Float = 2.0 // Movement peed
    public var radius: Float = 0.4 // Radius of the routine
    public var angle: Float = 0.0 // Current angle

    public var center: SIMD3<Float>

    public init(position: SIMD3<Float>) {
        center = [position.x, position.y, position.z]
    }
}
