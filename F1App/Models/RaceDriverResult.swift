//
//  File.swift
//  F1App
//
//  Created by Przemysław Woźny on 18/01/2022.
//

import Foundation

public struct APIResponseRaceDriver: Decodable{
    let MRData: GenericDataRaceDriver
}

public struct GenericDataRaceDriver: Decodable{
    let StandingsTable: StandingsTable
}

public struct StandingsTable: Decodable{
    let season: String
    let StandingsLists: [StandingsList]
}

public struct StandingsList: Decodable{
    let season: String
    let DriverStandings: [DriverStandings]
}

public struct DriverStandings: Decodable{
    let position: String
    let points: String
    let Driver: APIDriver
    init(position: String, points: String, Driver: APIDriver){
        self.position = position
        self.points = points
        self.Driver = Driver
    }
}
