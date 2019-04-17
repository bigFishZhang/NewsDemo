//
//  ZBTheme.swift
//  News
//
//  Created by bigfish on 2019/4/16.
//  Copyright © 2019 zzb. All rights reserved.
//

import Foundation
import SwiftTheme

enum ZBTheme:Int {
    case day   = 0
    case night = 1
    
    static var before  = ZBTheme.day
    static var current = ZBTheme.night
    
    static func switchTo(_ theme:ZBTheme) {
        before = current
        current = theme
        switch theme {
        case .day:ThemeManager.setTheme(plistName: "default_theme", path: .mainBundle)
        case .night:ThemeManager.setTheme(plistName: "night_theme", path: .mainBundle)
        }
    }
    static func switchNight(_ isToNight:Bool) {
        switchTo(isToNight ? .night : .day)
    }
    
    static func isNight() -> Bool {
        return current == .night
    }
    
    
    
    
    
}

