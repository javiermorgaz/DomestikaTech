//
//  VideoPlayerView.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @State var player: AVPlayer = AVPlayer()
    private var url: URL
    private let overlayImage: URL
    
    init(url: URL, overlayImage: URL) {
        self.url = url
        self.overlayImage = overlayImage
        player.replaceCurrentItem(with: AVPlayerItem(url: url))
    } 
    
    var body: some View {
        VideoPlayerObservableView(player: $player,
                                  overlayImage: overlayImage,
                                  readyObserver: VideoPlayerObserver(player: player))
    }
}
