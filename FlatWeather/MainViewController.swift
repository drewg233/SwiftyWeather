//
//  ViewController.swift
//  FlatWeather
//
//  Created by Andrew Garcia on 8/2/16.
//  Copyright © 2016 Andrew Garcia. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!

    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var currentWeather = CurrentWeather()
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func downloadForecastData(completed: DownloadComplete) {
        Alamofire.request(.GET,FORCAST_WEATHER_URL ).responseJSON { response in
            let result = response.result
            
            if let jsonObject = result.value as? Dictionary<String, AnyObject> {
                if let list = jsonObject["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDictionary: obj)
                        self.forecasts.append(forecast)
                    }
                }
            }
            completed()
        }
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(Int(currentWeather.currentTemperature))°"
        locationLabel.text = currentWeather.cityName
        currentWeatherTypeLabel.text = currentWeather.weatherType
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
        tableView.reloadData()
    }
    
    
    // TableView Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("WeatherCell", forIndexPath: indexPath) as? WeatherCell {
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    // CLLocation Methods
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        
        if let newLocation = location {
            currentLocation = newLocation
            print("Current Location: \(currentLocation)")
            if let latitude: Double = currentLocation.coordinate.latitude {
                Location.sharedInstance.latitude = latitude
                print("New Latitude: \(latitude)")
            }
            if let longitude: Double = currentLocation.coordinate.longitude {
                Location.sharedInstance.longitude = longitude
                print("New Longitude: \(longitude)")
            }
        }
        
        
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
        
        
        self.locationManager.stopUpdatingLocation()
        
        
    }

}

