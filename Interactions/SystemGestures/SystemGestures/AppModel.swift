// Created by Chester for SystemGestures in 2025

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let tapGesture = "tap-gesture"
    let spatialTapGesture = "spatial-tap-gesture"
    let dragGesture = "drag-gesture"
    let rotateGesture = "rotate-gesture"
    let magnifyGesture = "magnify-gesture"
    let gestureInOne = "gesture-in-one"
    
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed
}
