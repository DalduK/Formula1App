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
    var date = 2021
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
                print("decoded")
                self.completionHandler?(ScheduleList(response: response.MRData.RaceTable))
            }
        }.resume()
    }
}

public struct APIResponseSchedule: Decodable{
    let MRData: ScheduleData
}

public struct ScheduleData: Decodable{
    let xmlns: String
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let RaceTable: RaceTable
}

public struct RaceTable: Decodable{
    let Races: [APISchedule]
}

public struct APISchedule: Decodable{
    let season: String
    let round: String
    let url: String
    let raceName: String
    let Circuit: Circut
    let date: String
    let time: String
}

public struct Circut: Decodable{
    let circuitName: String
    let Location: Localization
}

public struct Localization: Decodable{
    let lat: String
    let long: String
    let locality: String
    let country: String
}

