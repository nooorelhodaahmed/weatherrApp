//
//  CityWeatherAPI.swift
//  WeatherApp
//
//  Created by user186640 on 11/30/20.
//

import Foundation


struct CityWeatherAPI{
    
   
    static let shared = CityWeatherAPI()
    
    
    
    func  getWeatherDataFromApi( url: String, parameters: [String: String],completion : @escaping (CityWeather) -> Void) {
        
        
        
        
        var components = URLComponents(string: url)!
            components.queryItems = parameters.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
            components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
            let request = URLRequest(url: components.url!)
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
           
         guard let data = data else {return}
         

         do {
            
            let postsResponse = try JSONDecoder().decode(CityWeather.self, from: data)
           
          
             completion(postsResponse)
         } catch {
             print("Error decoding Json comments - \(error)")
            
         }
         
        }).resume()
     
        
        }
        
    
    }
    
    
    
    


