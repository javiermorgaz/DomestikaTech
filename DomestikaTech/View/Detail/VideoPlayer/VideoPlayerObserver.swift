//
//  VideoPlayerObserver..swift
//  DomestikaTech
//
//  Created by Jmorgaz on 15/08/2020.
//
import Combine
import AVKit

class VideoPlayerObserver {
    
    let publisher = PassthroughSubject<Bool, Never>()
    
    init(player: AVPlayer) {
        let item = player.currentItem
        var cancellable: AnyCancellable?
        
        cancellable = NotificationCenter.default.publisher(for: .AVPlayerItemNewAccessLogEntry, object: item).sink { [weak self] item in
            
            if let item = item.object as? AVPlayerItem {
                if item.status == .readyToPlay {
                    self?.publisher.send(true)
                    cancellable?.cancel()
                }
            }
        }
    }
}
