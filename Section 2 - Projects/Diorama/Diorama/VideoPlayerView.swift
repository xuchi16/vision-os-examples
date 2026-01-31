// Created by Chester for MSCDemo in 2026

import AVKit
import SwiftUI

struct VideoPlayerWindowView: View {
    @State private var showPlayer = false

    var body: some View {
        VStack {
            Button("播放视频") {
                showPlayer = true
            }
            .buttonStyle(.borderedProminent)
        }
        .fullScreenCover(isPresented: $showPlayer) {
            VideoPlayerView()
        }
    }
}

struct VideoPlayerView: View {
    @State private var player = AVPlayer(
        url: URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!
    )

    var body: some View {
        SystemPlayerView(player: player)
            .onAppear {
                player.play()
            }
            .onDisappear {
                player.pause()
            }
    }
}

struct SystemPlayerView: UIViewControllerRepresentable {
    let player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let vc = AVPlayerViewController()
        vc.player = player
        return vc
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}

#Preview {
    VideoPlayerView()
}
