//
//  Filemanager-DocumentsDirectory.swift
//  WatchReactions WatchKit Extension
//
//  Created by Anthony Kim on 5/19/21.
//

import Foundation

extension FileManager {
    // tell us where documents directory is
    // use it to say append to it, our file name, our recording 
    func getDocumentsDirectory() -> URL { //every single time
        let paths = urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
