//
//  Forecast.swift
//  FlatWeather
//
//  Created by Andrew Garcia on 8/2/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import Foundation
import Alamofire

class Forecast {
    var _dayOfTheWeek: String?
    var _weatherType: String?
    var _highTemperature: Double?
    var _lowTemperature: Double?
    
    var dayOfTheWeek: String {
        if _dayOfTheWeek == nil {
            _dayOfTheWeek = ""
        }
        return _dayOfTheWeek!
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType!
    }
    
    var highTemperature: Double {
        if _highTemperature == nil {
            _highTemperature = 0.0
        }
        return _highTemperature!
    }
    
    var lowTemperature: Double {
        if _lowTemperature == nil {
            _lowTemperature = 0.0
        }
        return _lowTemperature!
    }
    
    init(weatherDictionary: Dictionary<String, AnyObject>) {
        // Min/Max
        if let temp = weatherDictionary["temp"] as? Dictionary<String, AnyObject> {
            if let minTemp = temp["min"] as? Double {
                self._lowTemperature = minTemp.convertKelvinToFahrenheit()
            }
            if let maxTemp = temp["max"] as? Double {
                self._highTemperature = maxTemp.convertKelvinToFahrenheit()
            }
        }
        // Weather
        if let weather = weatherDictionary["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        // Date
        if let date = weatherDictionary["dt"] as? Double {
            let unixConvertedDate = NSDate(timeIntervalSince1970: date)
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = .FullStyle
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .NoStyle
            self._dayOfTheWeek = unixConvertedDate.dayOfTheWeek()
        }
    }
}