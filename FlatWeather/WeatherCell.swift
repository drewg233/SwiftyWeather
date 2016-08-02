//
//  WeatherCell.swift
//  FlatWeather
//
//  Created by Andrew Garcia on 8/2/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    func configureCell(forecast: Forecast) {
        lowTempLabel.text = "\(forecast.lowTemperature)"
        highTempLabel.text = "\(forecast.highTemperature)"
        dayLabel.text = "\(forecast.dayOfTheWeek)"
        
        weatherIcon.image = UIImage(named: "\(forecast.weatherType) Mini")
    }
}
