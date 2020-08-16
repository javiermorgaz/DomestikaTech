//
//  VideoPlayerObservableView.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 16/08/2020.
//

import SwiftUI
import AVKit
import SDWebImageSwiftUI

struct VideoPlayerObservableView: View {
    
    @Binding var player: AVPlayer
    @State var isplaying = true
    @State var showControls = false
    @State var showOverlayImage = true
    @State var timeObserver: Any? = nil
    let overlayImage: URL
    let readyObserver: VideoPlayerObserver
    
    var body: some View {
        ZStack{
            VideoPlayerViewController(player: $player)
                .accessibility(addTraits: .isButton)
                .accessibility(identifier: "VideoPlayer")
                .frame(height: 210)
                .onAppear {
                    player.play()
                }
                .onDisappear() {
                    stopPlayer()
                }
                .onTapGesture {
                    if !showOverlayImage {
                        showControls = true
                    }
                }
                .onReceive(readyObserver.publisher) { isReady in
                    showOverlayImage = !isReady
                }
            if showOverlayImage {
                OverlayImage
            } else if showControls && !showOverlayImage {
                VideoPlayerControlsView(player: $player,
                                        isplaying: $isplaying,
                                        showControls: $showControls,
                                        timeObserver: $timeObserver)
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

extension VideoPlayerObservableView {
    
    var OverlayImage: some View {
        ZStack{
            WebImage(url: overlayImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .accessibility(identifier: "VideoOverlayImage")
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
        }
    }
}
