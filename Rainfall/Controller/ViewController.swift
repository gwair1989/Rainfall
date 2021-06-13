//
//  ViewController.swift
//  Rainfall
//
//  Created by Aleksandr Khalupa on 07.03.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, WeatherManagerDelegate, CLLocationManagerDelegate {

    

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windButton: UIButton!
    @IBOutlet weak var wetButton: UIButton!
    

    let weatherManager = WeatherManager()
    let locationManager = CLLocationManager()

    var lat = 50.4501
    var lon = 30.5234

    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.requestLocation()
    }

    
    @IBAction func pressedLocation(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
    func getWetherData(weather: WeatherModel) {
        tempLabel.text = " \(weather.temp)˚"
        wetButton.setTitle(" \(weather.indexRH) %", for: .normal)
        windButton.setTitle(" \(weather.windSpeed) km/h", for: .normal)
        title = weather.cityName
        descriptionLabel.text = weather.descriptionWeather
        weatherImage.image = weather.getImage
        background.backgroundColor = weather.colorBackground
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinates = locations.last?.coordinate{
            lat = coordinates.latitude
            lon = coordinates.longitude
            weatherManager.requestWeather(lat: lat, lon: lon)
            print(lat)
            print(lon)
            manager.stopUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

