//
//  ObservableObject.swift
//  iOS-101
//
//  Created by ablai erzhanov on 04.06.2023.
//


import SwiftUI


////////////////////////////////////////////////////////////////////////////////////////////////////////
// MARK: --------- ObservableObject ------------
////////////////////////////////////////////////////////////////////////////////////////////////////////


class PodcastPlayer: ObservableObject {
    @Published private(set) var isPlaying: Bool = false

    func play() {
        isPlaying = true
    }

    func pause() {
        isPlaying = false
    }
}


struct ObservableObjectView: View {
    @ObservedObject var player: PodcastPlayer = PodcastPlayer()
    
    var body: some View {
        List {
            Button(
                action: {
                    if self.player.isPlaying {
                        self.player.pause()
                    } else {
                        self.player.play()
                    }
                }, label: {
                    Text(player.isPlaying ? "Pause": "Play")
                }
            )
        }
    }
    
}

struct ObservableObject_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectView(player: PodcastPlayer())
    }
}
