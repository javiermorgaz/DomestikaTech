//
//  VPlayerView.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 14/08/2020.
//

import SwiftUI
import AVKit

struct VPlayerView : UIViewControllerRepresentable {
    @Binding var player : AVPlayer
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<VPlayerView>) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<VPlayerView>) {}
}

struct VPlayerControlsView : View {
    
    @Binding var player : AVPlayer
    @Binding var isplaying : Bool
    @Binding var showControls : Bool
    @Binding var timeObserver: Any?
    @State var value : Float = 0
    @State var currentTime: Double = 0
    
    var body : some View {
        
        VStack{
            Spacer()
            HStack(spacing: 40) {
                Button(action: {
                    guard let item = self.player.currentItem else {
                      return
                    }
                    
                    let seconds = Double(Double(self.value) * item.duration.seconds)
                    player.seek(to: CMTime(seconds: seconds - 10, preferredTimescale: 1))
                }) {
                    Image(systemName: "gobackward.10")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(20)
                }
                Button(action: {
                    if self.isplaying{
                        self.player.pause()
                        self.isplaying = false
                    }
                    else{
                        self.player.play()
                        self.isplaying = true
                    }
                }) {
                    Image(systemName: self.isplaying ? "pause.circle" : "play.circle")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(20)
                }
                Button(action: {
                    guard let item = self.player.currentItem else {
                      return
                    }
                    
                    let seconds = Double(Double(self.value) * item.duration.seconds)
                    player.seek(to: CMTime(seconds: seconds + 10, preferredTimescale: 1))
                    
                }) {
                    Image(systemName: "goforward.10")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(20)
                }
            }
            Spacer()
            HStack {
                Slider(value: $value, in: 0...1) { isEditing in
                    guard let item = self.player.currentItem else {
                      return
                    }

                    let seconds = Double(value * Float(item.duration.seconds))
                    if isEditing {
                        player.pause()
                        player.seek(to: CMTime(seconds: seconds, preferredTimescale: 1))
                    } else {
                        player.seek(to: CMTime(seconds: seconds, preferredTimescale: 1))
                        if isplaying{
                            player.play()
                        }
                    }
                }
                .accentColor(Color.separatorColor)
                Text("\(currentTime.toTime)")
                    .font(.caption)
                    .frame(width: 45, height: 20)
                    .background(Color.white)
                    .cornerRadius(5)
            }
        }.padding()
        .background(Color.black.opacity(0.4))
        .onTapGesture {
            showControls = false
        }
        .onAppear {
            timeObserver = player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: .main) { (_) in
                guard let item = player.currentItem else {
                      return
                    }
                
                value = Float(item.currentTime().seconds / item.duration.seconds)
                currentTime = item.currentTime().seconds
                
                if value == 1.0 {
                    isplaying = false
                }
            }
        }
    }
}
