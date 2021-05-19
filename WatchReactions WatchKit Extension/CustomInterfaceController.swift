//
//  CustomInterfaceController.swift
//  WatchReactions WatchKit Extension
//
//  Created by Anthony Kim on 5/19/21.
//

import WatchKit
import AVFoundation


class CustomInterfaceController: WKInterfaceController {
    // massive long url
    let saveURL = FileManager.default.getDocumentsDirectory().appendingPathComponent("recording.wav")
    var audioplayer: AVAudioPlayer?
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func recordTapped() { // record audio and save that to the file
        presentAudioRecorderController(withOutputURL: saveURL,
                                       preset: .narrowBandSpeech) {
            success, error in
            // when recording is finished what do you want to do
            if success {
                print("saved successfully!")
            } else {
                print(error?.localizedDescription ?? "Unknown error")
            }
        }
    }
    
    @IBAction func playTapped() { // do something in plist
        // if it tries to play before recording, just silently do nothing
        guard FileManager.default.fileExists(atPath: saveURL.path) else { return }
        
        try? audioplayer = AVAudioPlayer(contentsOf: saveURL)
        audioplayer?.play()
    }
    
}
