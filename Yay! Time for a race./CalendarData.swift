//
//  CalendarData.swift
//  Yay! Time for a race.
//
//  Created by Madelin Woods on 7/24/16.
//  Copyright © 2016 Madelin Woods. All rights reserved.
//

import Foundation

class CalendarData {
    class var calendarInstance: CalendarData {
        struct Static {
            static var instance: CalendarData?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = CalendarData()
        }
        
        return Static.instance!
    }
    
    var timeToRace : NSDate!
    
}
