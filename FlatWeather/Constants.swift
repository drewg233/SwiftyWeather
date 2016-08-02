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

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)35\(API_KEY)"
let FORCAST_WEATHER_URL = "\(BASE_FORECAST_URL)\(LATITUDE)35\(LONGITUDE)35\(DAYCOUNT)6\(API_KEY)"

typealias DownloadComplete = () -> ()