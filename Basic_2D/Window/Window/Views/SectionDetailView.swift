// Created by Chester for Window in 2025

import SwiftUI

struct SectionDetailView: View {
    @Environment(\.openURL) var openURL
    
    var section: Section
    var body: some View {
        VStack {
            Text("Section \(section.id). \(section.description)")
                .font(.body)
                .padding()
                .navigationTitle(section.name)
        }
        .toolbar {
#if os(visionOS)
            ToolbarItemGroup(placement: .bottomOrnament) {
                Button("Website", systemImage: "safari") {
                    openURL(section.url)
                }
                
                Button("Tag", systemImage: "tag") {
                    print("Tag the section")
                }
            }
#else
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button("Website", systemImage: "safari") {
                    openURL(section.url)
                }
                
                Button("Tag", systemImage: "tag") {
                    print("Tag the section")
                }
            }
#endif
            
        }
    }
    
    init(section: Section) {
        self.section = section
    }
}
