//
//  WeatherManager.swift
//  Rainfall
//
//  Created by Aleksandr Khalupa on 25.03.2021.
//

import Foundation

protocol WeatherManagerDelegate {
    func getWetherData(weather: WeatherModel)
}

class WeatherManager{
    var delegate: WeatherManagerDelegate?
    let weatherURL = "https://api.weatherbit.io/v2.0/current?&key=\(K.keyAPI)&lang=ru"
    
    
    
    func requestWeather(lat:Double, lon:Double){
//        передаем координаты города
        
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        guard let weatherURL = URL(string: urlString) else{return}
//        преобразования ссылки в URL
        let urlSession = URLSession(configuration: .default)
//        открываем сесию через екзепяляр класа URLSession
       let dataTask = urlSession.dataTask(with: weatherURL) { (data, urlResponse, error) in
//          запускаем замыкание которое получает данные
        if error != nil{return}
        guard let receivedData = data else{return}
        guard let wetherModel = self.hendlingJson(recData: receivedData) else {return}
//        отправляем на раскодировку через hendlingJson
        DispatchQueue.main.async {
            self.delegate?.getWetherData(weather: wetherModel)
        }
        
        }
        dataTask.resume()
//         возобноление подключение в случае потери соедиенения с интернетом(обновление)
    }
    
    func hendlingJson(recData:Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do {
//            через экзепяляр класа JSONDecoder получаем метод decode
          let decodeData = try decoder.decode(WeatherData.self, from: recData)
//            подставляем экземпляр класа WeatherData помеченый протоколом Сodable, recData - даные полученые из сесии
            let wetherModel = WeatherModel(windSpeed: decodeData.data[0].wind_spd, temp: decodeData.data[0].temp, indexRH: decodeData.data[0].rh, cityName: decodeData.data[0].city_name, indexWeather: decodeData.data[0].weather.code, descriptionWeather: decodeData.data[0].weather.description)
        
            
//            через экзеплятр класса wetherModel передаем данные в класс WeatherModel
            return wetherModel
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    
    
    
}
