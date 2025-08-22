//
//  EarthView.swift
//  SurfaceShader
//
//  Created by xuchi on 2024/9/18.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct EarthView: View {
    
    @Environment(AppModel.self) var model
    @State var earthModel: ModelEntity?
    @State var material: ShaderGraphMaterial?
    
    var body: some View {
        RealityView { content in
            guard let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) else {
                print("Failed to load")
                return
            }
            guard let earth = scene.findEntity(named: "DynamicEarth") else {
                print("Failed to load earth")
                return
            }
            guard let earthModel = earth as? ModelEntity else {
                print("Earth is not a model")
                return
            }
            guard let material = earthModel.model?.materials.first as? ShaderGraphMaterial else {
                print("Failed to laod material")
                return
            }
            self.earthModel = earthModel
            self.material = material
            earth.position = [0, 0, 0]
            content.add(earth)
            
            guard let earthCloud = scene.findEntity(named: "EarthCloud") else {
                print("Failed to load earth")
                return
            }
            earthCloud.position = [0, 0, 0]
            content.add(earthCloud)
        }
        .onChange(of: model.percentage) {
            guard var earthModel else {
                print("No earth model")
                return
            }
            guard var material else {
                print("No shader graph material")
                return
            }
            try? material.setParameter(name: "Percentage", value: .float(Float(model.percentage)))
            earthModel.model?.materials = [material]
        }
    }
}

#Preview {
    EarthView()
}
