//
//  VideoPlayerViewController.swift
//  DomestikaTech
//
//  Created by Jmorgaz on 14/08/2020.
//

import SwiftUI
import AVKit

struct VideoPlayerViewController: UIViewControllerRepresentable {
    @Binding var player: AVPlayer

    func makeUIViewController(context: UIViewControllerRepresentableContext<VideoPlayerViewController>) -> AVPlayerViewController {

        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        controller.videoGravity = .resizeAspectFill
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<VideoPlayerViewController>) {}
}
