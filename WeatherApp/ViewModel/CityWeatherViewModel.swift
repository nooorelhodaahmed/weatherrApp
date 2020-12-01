//
//  CityWeatherViewModel.swift
//  WeatherApp
//
//  Created by user186640 on 11/30/20.
//

import Foundation

struct CityWeatherViewModel {
    
    let weather : List
    
    init(weather:List){
        self.weather = weather
    }
    
    var cityTemp: Int? {
        return Int((weather.main?.temp)!)
    }
    }
