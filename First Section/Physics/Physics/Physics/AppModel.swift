// Created by Chester for Physics in 2025

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let gravity = "gravity"
    let force = "force"
    let torque = "torque"
    let restitution = "restitution"
    let friction = "friction"
    
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed
}
