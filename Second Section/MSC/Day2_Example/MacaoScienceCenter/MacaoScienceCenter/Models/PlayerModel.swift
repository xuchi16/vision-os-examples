// Created by Chester for MacaoScienceCenter in 2026

import AVKit
import Foundation
import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class PlayerModel {
    private var player = AVPlayer()
    private var item: AVPlayerItem?
    private var timeObserverToken: Any?
    private var currentVideo: Video?
    
    init() {}
    
    func load(_ video: Video) {
        currentVideo = video
        item = AVPlayerItem(url: video.url)
        player.replaceCurrentItem(with: item)
    }
    
    func genViewController() -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        return controller
    }
}

struct Video: Identifiable, Hashable, Codable {
    let id: Int
    let url: URL
    let eventTimesInSecond: [Double]
    
    func getEventTimes() -> [NSValue] {
        var result: [NSValue] = []
        for eventTime in eventTimesInSecond {
            result.append(NSValue(time: CMTime(seconds: eventTime, preferredTimescale: 1)))
            result.append(NSValue(time: CMTime(seconds: eventTime + 8, preferredTimescale: 1)))
        }
        return result
    }
    
    func getEventTimesVal() -> [CMTime] {
        var result: [CMTime] = []
        for eventTime in eventTimesInSecond {
            result.append(CMTime(seconds: eventTime, preferredTimescale: 1))
        }
        return result
    }
}
