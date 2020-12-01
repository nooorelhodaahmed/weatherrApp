//
//  CityAPI.swift
//  WeatherApp
//
//  Created by user186640 on 11/29/20.
//

import Foundation

struct CityAPI {
    
    static let shared = CityAPI()
    
    func  getDataFromApi(withUrl strUrl: String,completion : @escaping ([City]) -> Void) {
           
       guard let url = URL(string: strUrl) else {return}
      
       URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
           
          
        guard let data = data else {return}
        
           
       // let dataAsString = String(data: data,encoding: .utf8)
         //  print(dataAsString)
        
        
        
        do {
            let postsResponse = try JSONDecoder().decode([City].self, from: data)
            print(postsResponse[0].country)
           
            completion(postsResponse)
        } catch {
            print("Error decoding Json comments - \(error)")
           //completion(nil)
        }
        
       }).resume()
    
       
       }
}

