//
//  Temperature.swift
//  FlatWeather
//
//  Created by Andrew Garcia on 8/2/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import Foundation

extension Double {
    func convertKelvinToFahrenheit() -> Double {
        let preKelvinToFarenheit = (self * (9/5) - 459.76)
        let kelvinToFarenheit = Double(round(10 * preKelvinToFarenheit/10))
        return kelvinToFarenheit
    }
}