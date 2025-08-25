// Created by Chester for MSC in 2025

import RealityKit
import SwiftUI

struct MoonAndSunView: View {
    var body: some View {
        RealityView { content, attachments in
            // ====== MOON =======
            guard let moon = try? await Entity(named: "Moon") else {
                print("No such model")
                return
            }

            moon.position = [-0.15, 0, 0]
            content.add(moon)
            
            if let moonTag = attachments.entity(for: "moonTag") {
                moonTag.position = [0, -0.15, 0]
                moon.addChild(moonTag)
            }

            // ====== SUN =======
            guard let sun = try? await Entity(named: "Sun") else {
                return
            }
            sun.position = [0.15, 0, 0]
            sun.scale *= 1
            content.add(sun)
            
            if let sunTag = attachments.entity(for: "sunTag") {
                sunTag.position = [0, -0.15, 0]
                sun.addChild(sunTag)
            }
        } attachments: {
            Attachment(id: "moonTag") {
                Text("Moon 月亮")
                    .font(.title)
                    .padding()
                    .glassBackgroundEffect()
            }
            
            Attachment(id: "sunTag") {
                Text("Sun 太阳")
                    .font(.title)
                    .padding()
                    .glassBackgroundEffect()
            }
        }
        
        
    }
}

#Preview {
    MoonAndSunView()
}
