//
//  VideoPlayerView.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @State var player = AVPlayer()
    @State var isplaying = true
    @State var showControls = false
    @State var timeObserver: Any? = nil
    
    private var url: URL
    
    init(url: URL) {
        self.url = url
        player.replaceCurrentItem(with: AVPlayerItem(url: url))
    }
    
    var body: some View {
        
        ZStack{
            VideoPlayerViewController(player: $player)
                .frame(height: 210)
                .onAppear {
                    player.play()
                }
                .onDisappear() {
                    stopPlayer()
                }
                .onTapGesture {
                    showControls = true
                }
            
            if showControls {
                VideoPlayerControlsView(player: $player, isplaying: $isplaying, showControls: $showControls, timeObserver: $timeObserver)
            }
        }
    }
    
    private func stopPlayer() {
        player.pause()
        player.replaceCurrentItem(with: nil)
        if let timeObserver = timeObserver {
            player.removeTimeObserver(timeObserver)
            self.timeObserver = nil
        }
    }
}
