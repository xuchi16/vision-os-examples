// Created by Chester for Window in 2025

import SwiftUI

struct SectionView: View {
    var sections: [Section] = []
    @State var section: Section?
    
    var body: some View {
        NavigationSplitView {
            List(sections, selection: $section) { section in
                NavigationLink(section.name, value: section)
            }
            .navigationTitle("Course Sections")
        } detail: {
            if let section {
                SectionDetailView(section: section)
            }  else {
                Text("Please select a section")
            }
            
        }
    }
    
    init() {
        sections = Section.example
    }
}

struct Section: Identifiable, Hashable {
    var id: Int
    var name: String
    var description: String
    var url: URL
    
    static let example = [
        Section(id: 1,
                name: "Introduction",
                description: "Overview of the course",
                url: URL(string: "https://xz3t11cmy1.feishu.cn/slides/GuBhsYteMlLDRedLRcLcYykJnFc")!),
        Section(id: 2,
                name: "Environment",
                description: "Development environment",
                url: URL(string: "https://xz3t11cmy1.feishu.cn/docx/Og3Zdtj38odMKBxiMrbcAvCpnPg")!),
        Section(id: 3,
                name: "2D Apps",
                description: "Build basic 2D apps",
                url: URL(string: "https://xz3t11cmy1.feishu.cn/docx/Mg7NdQug4oCzpRxwvhZcrAu6nje")!),
        Section(id: 4,
                name: "3D Apps",
                description: "Add 3D elements to 2D apps",
                url: URL(string: "https://github.com/xuchi16/vision-os-workshop")!)
    ]
}
