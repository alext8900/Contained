//
//  Settings.swift
//  Contained
//
//  Created by Alex Thompson on 10/2/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class Settings {
    static let shared = Settings()
    private init() {}
    
    var shouldRoll = false
    var shouldZoom = false
    
}

