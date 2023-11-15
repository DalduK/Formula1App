//
//  RaceDriverResultService.swift
//  F1App
//
//  Created by Przemysław Woźny on 18/01/2022.
//

import Foundation

public final class RaceDriverService{
    var completionHandler: (([DriverStandings]) -> Void)?
    var date = "2023"
    var round = "1"
    public func loadDriverData(_ completionHandler: @escaping(([DriverStandings]) -> Void)){
        getHomeData()
        self.completionHandler = completionHandler
    }
    
    init(){
        getHomeData()
    }
    
    init(date: String, round: String){
        self.date = date
        self.round = round
    }
    
    func updateData(date: String, round: String){
        self.date = date
        self.round = round
    }
    
    func getHomeData() {
        let urlString = "https://ergast.com/api/f1/\(date.prefix(4))/\(round)/driverStandings.json"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {return}
            if let response = try? JSONDecoder().decode(APIResponseRaceDriver.self, from: data){
                self.completionHandler?(response.MRData.StandingsTable.StandingsLists[0].DriverStandings)
            }
        }.resume()
    }
}
