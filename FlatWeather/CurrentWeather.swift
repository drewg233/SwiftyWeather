//
//  CurrentWeather.swift
//  FlatWeather
//
//  Created by Andrew Garcia on 8/2/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String?
    var _date: String?
    var _weatherType: String?
    var _currentTemperature: Double?
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName!
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        dateFormatter.timeStyle = .NoStyle
        let currentDate = dateFormatter.stringFromDate(NSDate())
        self._date = "Today, \(currentDate)"
        return _date!
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType!
    }
    
    var currentTemperature: Double {
        if _currentTemperature == nil {
            _currentTemperature = 0.0
        }
        return _currentTemperature!
    }
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        Alamofire.request(.GET, CURRENT_WEATHER_URL).responseJSON { response in
            let result = response.result
            
            if let jsonObject = result.value as? Dictionary<String, AnyObject> {
                
                
                if let name = jsonObject["name"] as? String {
                    self._cityName = name
                    print(self._cityName)
                }
                
                if let weather = jsonObject["weather"] as? [Dictionary<String, AnyObject>] {
                    if let mainWeather = weather[0]["main"] as? String {
                        self._weatherType = mainWeather
                        print(self._weatherType)
                    }
                }
                
                if let main = jsonObject["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemperature = main["temp"] as? Double {
                        self._currentTemperature = currentTemperature.convertKelvinToFahrenheit()
                        print(self._currentTemperature)
                    }
                }
            }
            completed()
        }
    }
    
    
}