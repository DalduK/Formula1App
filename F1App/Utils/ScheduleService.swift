//
//  ScheduleService.swift
//  F1App
//
//  Created by Przemysław Woźny on 26/10/2021.
//

import Foundation

//
//  DriverService.swift
//  F1App
//
//  Created by Przemysław Woźny on 23/10/2021.
//

import Foundation
import SwiftUI


public final class ScheduleService{
    var completionHandler: ((ScheduleList) -> Void)?
    var date = 2023
    public func loadScheduleData(_ completionHandler: @escaping((ScheduleList) -> Void)){
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
        let urlString = "https://ergast.com/api/f1/\(String(date)).json"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {return}
            if let response = try? JSONDecoder().decode(APIResponseSchedule.self, from: data){
                self.completionHandler?(ScheduleList(response: response.MRData.RaceTable))
            }
        }.resume()
    }
}



