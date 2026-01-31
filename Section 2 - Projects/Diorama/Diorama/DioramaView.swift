// Created by Chester for MSCDemo in 2026

import RealityKit
import RealityKitContent
import SwiftUI

struct DioramaWindowView: View {
    @Environment(\.openWindow) var openWindow

    var body: some View {
        Button("打开沙盘") {
            openWindow(id: "diorama")
        }
    }
}

struct DioramaView: View {
    @State var showIntroduction: Bool = false
    @Environment(\.openWindow) var openWindow

    var body: some View {
        RealityView { content, attachments in
            guard let diorama = try? await Entity(named: "Diorama", in: realityKitContentBundle) else {
                return
            }
            content.add(diorama)

            if let panel = attachments.entity(for: "panel") {
                panel.position = [0, 0, 0.3]
                content.add(panel)
            }
            if let intro = attachments.entity(for: "intro") {
                intro.position = [0, 0.3, 0]
                content.add(intro)
            }
            
            

        } update: { _, attachments in
            // 当状态改变时更新intro的显示状态
            if let intro = attachments.entity(for: "intro") {
                // 根据showIntroduction切换显示/隐藏
                if intro.isEnabled != showIntroduction {
                    intro.isEnabled = showIntroduction
                }
            }

            
        } attachments: {
            Attachment(id: "panel") {
                HStack {
                    Toggle(isOn: $showIntroduction) {
                        Image(systemName: showIntroduction ? "info.circle.fill" : "info.circle")
                            .imageScale(.large)
                    }
                    .toggleStyle(.button)
                    .buttonStyle(.plain)
                    .padding()
                    
                    Button {
                        openWindow(id: "video")
                    } label: {
                        Image(systemName: "video")
                    }
                    .padding()
                }
                .padding()
                .glassBackgroundEffect()
            }

            Attachment(id: "intro") {
                VStack {
                    Text("Catalina")
                        .font(.title)

                    Text("""
                    Welcome to Catalina Island, a Mediterranean-esque jewel floating just off the coast of Southern California. More than just a destination, Catalina is a world apart—a captivating blend of rugged, untouched wilderness and charming, small-town serenity. Leave the mainland pace behind as you step into the timeless ambiance of Avalon, with its iconic Casino building gracing the picturesque harbor. Here, adventure whispers on the ocean breeze, inviting you to explore vibrant underwater gardens, hike through pristine interior hills rich with native wildlife, or simply unwind on a sun-drenched coastline. Whether you seek peaceful retreat or active discovery, Catalina offers an unforgettable escape where memories are made, just 22 miles from the everyday.
                    """)
                }
                .padding()
                .glassBackgroundEffect()
            }
        }
    }
}

#Preview {
    DioramaView()
}
