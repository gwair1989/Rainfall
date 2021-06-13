//
//  WeatherModel.swift
//  Rainfall
//
//  Created by Aleksandr Khalupa on 25.03.2021.
//

import UIKit

struct WeatherModel {
    let windSpeed:Float
    let temp:Float
    let indexRH :Int
    let cityName:String
    let indexWeather:Int
    let descriptionWeather:String


    var getImage: UIImage{
        switch indexWeather {
        case 200...233:
            return #imageLiteral(resourceName: "200-233&900")
        case 300...522:
            return #imageLiteral(resourceName: "300-522")
        case 600...602:
            return #imageLiteral(resourceName: "600-602&621-623")
        case 621...623:
            return #imageLiteral(resourceName: "600-602&621-623")
        case 610...612:
            return #imageLiteral(resourceName: "610-612")
        case 800:
            return #imageLiteral(resourceName: "800")
        case 801...802:
            return #imageLiteral(resourceName: "801-802")
        case 803:
            return #imageLiteral(resourceName: "803")
        case 804:
            return #imageLiteral(resourceName: "804")
        default:
            return #imageLiteral(resourceName: "200-233&900")
        }
    }
    var colorBackground: UIColor{
        switch temp {
        case ...20:
            return UIColor(named: "cold") ?? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        case 21...28:
            return UIColor(named: "heat") ?? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        case 29...:
            return UIColor(named: "hot") ?? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        default:
            return UIColor(named: "cold") ?? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
    }

}
