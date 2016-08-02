//
//  Constants.swift
//  FlatWeather
//
//  Created by Andrew Garcia on 8/2/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let BASE_FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let DAYCOUNT = "&cnt="
let API_KEY = "&appid=APIKEYHERE"

let locationLatitude = Location.sharedInstance.latitude
let locationLongitude = Location.sharedInstance.longitude

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(locationLatitude)\(LONGITUDE)\(locationLongitude)\(API_KEY)"
let FORCAST_WEATHER_URL = "\(BASE_FORECAST_URL)\(LATITUDE)\(locationLatitude)\(LONGITUDE)\(locationLongitude)\(DAYCOUNT)6\(API_KEY)"

typealias DownloadComplete = () -> ()