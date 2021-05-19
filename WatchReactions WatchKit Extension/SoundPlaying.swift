//
//  SoundPlaying.swift
//  WatchReactions WatchKit Extension
//
//  Created by Anthony Kim on 5/18/21.
//

import AVFoundation

protocol SoundPlaying: AnyObject {
    var audioPlayer: AVAudioPlayer? { get set }
}

// look for file in our bundle and load into player and play it back
extension SoundPlaying {
    func playSound(named name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "mp3") else {
            fatalError("Unable to find sound file \(name).mp3")
        }
        try? audioPlayer = AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
    }
}
