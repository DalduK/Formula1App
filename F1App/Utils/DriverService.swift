//
//  DriverService.swift
//  F1App
//
//  Created by Przemysław Woźny on 23/10/2021.
//

import Foundation
import SwiftUI


public final class DriverService{
    var completionHandler: ((DriverList) -> Void)?
    var date = 2023
    public func loadDriverData(_ completionHandler: @escaping((DriverList) -> Void)){
        getHomeData()
        self.completionHandler = completionHandler
    }
    
    init(){
        getHomeData()
    }
    
    func updateDate(date: Int){
        self.date = date
    }
    
    func getHomeData() {
        let urlString = "https://ergast.com/api/f1/\(String(date))/drivers.json"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {return}
            if let response = try? JSONDecoder().decode(APIResponse.self, from: data){
                self.completionHandler?(DriverList(response: response.MRData.DriverTable))
            }
        }.resume()
    }
}


