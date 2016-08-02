//
//  Date.swift
//  FlatWeather
//
//  Created by Andrew Garcia on 8/2/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import Foundation

extension NSDate {
    func dayOfTheWeek() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.stringFromDate(self)
    }
}