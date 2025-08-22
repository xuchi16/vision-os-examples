//
//  AppModel.swift
//  L5_SpatialBasics
//
//  Created by xuchi on 2024/7/3.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let immersiveSpaceID = "ImmersiveSpace"
    let componentImmersiveSpaceID = "ComponentImmersiveSpace"
    let customizeComponentSpaceID = "CustomizeComponentSpace"
    
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed
}
