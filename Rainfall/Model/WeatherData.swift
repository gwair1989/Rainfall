//
//  WeatherData.swift
//  Rainfall
//
//  Created by Aleksandr Khalupa on 25.03.2021.
//

import Foundation

struct WeatherData:Codable {
    let data:[JsonData]
}

struct JsonData:Codable {
    let wind_spd:Float
    let temp:Float
    let rh:Int
    let city_name:String
    let weather:WetherIndex
}

struct WetherIndex:Codable {

        let code:Int
        let description:String

}



