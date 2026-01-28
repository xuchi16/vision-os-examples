// Created by Chester for Media in 2026

import AVKit
import RealityKit
import RealityKitContent
import SwiftUI

struct ContentView: View {
    @State private var showPlayer = false

    var body: some View {
        VStack {
            Button("播放视频") {
                showPlayer = true
            }
            .buttonStyle(.borderedProminent)

            AudioPlayerView()
        }.fullScreenCover(isPresented: $showPlayer) {
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

struct AudioPlayerView: View {
    @State private var player: AVAudioPlayer?

    var body: some View {
        Button("播放音频") {
            playAudio()
        }
        .buttonStyle(.borderedProminent)
    }

    private func playAudio() {
        guard let url = Bundle.main.url(forResource: "demo", withExtension: "wav") else {
            print("找不到 demo.wav")
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("音频播放失败:", error)
        }
    }
}
