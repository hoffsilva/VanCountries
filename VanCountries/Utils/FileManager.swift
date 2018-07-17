//
//  FileManager.swift
//  VanCountries
//
//  Created by Hoff Henry Pereira da Silva on 16/07/2018.
//  Copyright © 2018 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

struct FileManager {
    
    /// Load file to dictionary.
    /// The file needs extension .plist
    ///
    /// - Parameter name: File name
    /// - Returns: Dictionary of file
    static func load(name: String) -> NSMutableDictionary?{
        if let bundle = Bundle.main.path(forResource: name, ofType: "plist") {
            let file = NSMutableDictionary(contentsOfFile: bundle)
            return file
        }
        return nil
    }
}
