//
//  ContentView.swift
//  SurfaceShader
//
//  Created by xuchi on 2024/9/18.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openWindow) var openWindow
    @Environment(AppModel.self) var model
    
    @State var sliderValue: Double = 0
    
    var body: some View {
        VStack {
            Text("Earth")
                .font(.title)
            
            Button("Open") {
                openWindow(id: "earth")
            }
            
            Slider(value: $sliderValue, in: 0...1)
                .padding()
        }
        .padding()
        .onChange(of: sliderValue) {
            model.percentage = sliderValue
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
