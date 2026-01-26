// Created by Chester for Window in 2025

import SwiftUI

struct ProjectView: View {
    var body: some View {
        VStack {
            Text("Project introductions")
                .font(.title)
        }
#if os(visionOS)
        .ornament(attachmentAnchor: .scene(.bottom)) {
            HStack {
                Button("pencil", systemImage: "pencil") {
                    print("write")
                }
                .help("Pencil")
                .padding()
                
                Button("eraser", systemImage: "eraser") {
                    print("clean")
                }
                .help("Eraser")
                .padding()
                
                Divider()
                    .padding(.vertical)
                
                Button("undo", systemImage: "arrow.counterclockwise") {
                    print("undo")
                }
                .help("Undo")
                .padding()
            }
            .glassBackgroundEffect()
            .buttonStyle(.borderless)
            .labelStyle(.iconOnly)
            .padding()
        }
#endif
    }
}

#Preview {
    ProjectView()
}
