//
//  RaceService.swift
//  F1App
//
//  Created by Przemysław Woźny on 18/01/2022.
//

import Foundation

public final class RaceService{
    var completionHandler: (([RaceData]) -> Void)?
    var date = "2021"
    var round = "1"
    public func loadDriverData(_ completionHandler: @escaping(([RaceData]) -> Void)){
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
        let urlString = "https://ergast.com/api/f1/\(date.prefix(4))/\(round)/results.json"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {return}
            if let response = try? JSONDecoder().decode(APIResponseRace.self, from: data){
                self.completionHandler?(response.MRData.RaceTable.Races)
            }
        }.resume()
    }
}
