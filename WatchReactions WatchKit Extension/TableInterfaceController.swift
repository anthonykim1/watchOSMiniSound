//
//  TableInterfaceController.swift
//  WatchReactions WatchKit Extension
//
//  Created by Anthony Kim on 5/18/21.
//

import WatchKit
import AVFoundation

// equivalent of ui view controller.

class TableInterfaceController: WKInterfaceController, SoundPlaying {

    @IBOutlet var table: WKInterfaceTable!
    var audioPlayer: AVAudioPlayer?
    
    let sounds = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil)?.map
    { $0.deletingPathExtension().lastPathComponent }.sorted() ?? [] // now contain sorted alphabetical list of all the mp3 in our app ready to go
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        table.setNumberOfRows(sounds.count, withRowType: "Row") // one for every sound we have
        
        // loop over every sound and configure the row at that location with that sound
        for (index, sound) in sounds.enumerated() {
            guard let row = table.rowController(at: index) as? SoundRow else {
                continue
            }
            row.textLabel.setText(sound) // that sound name
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        //row 0 tapped what do you want to do everytime?
        // go ahead and play sound
        playSound(named: sounds[rowIndex])
    }
}
