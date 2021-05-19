//
//  InterfaceController.swift
//  WatchReactions WatchKit Extension
//
//  Created by Anthony Kim on 5/18/21.
//

import WatchKit
import AVFoundation


class InterfaceController: WKInterfaceController, SoundPlaying {
    var audioPlayer: AVAudioPlayer?

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    @IBAction func playSound1() {
        playSound(named: "core")
    }
    
    @IBAction func playSound2() {
        playSound(named: "home")
    }
    
    @IBAction func playSound3() {
        playSound(named: "fly")
    }
    
    @IBAction func playSound4() {
        playSound(named: "myturn")
    }
    
    
}
