//
//  Race.swift
//  F1App
//
//  Created by Przemysław Woźny on 18/01/2022.
//

import Foundation

public struct APIResponseRace: Decodable{
    let MRData: GenericDataRace
}

public struct GenericDataRace: Decodable{
    let RaceTable: RaceValuesTable
}

public struct RaceValuesTable: Decodable{
    let season: String
    let Races: [RaceData]
}

public struct RaceData: Decodable{
    let date: String
    let Results: [RaceResult]
}

public struct RaceResult: Decodable{
    let number: String
    let position: String
    let points: String
    let Driver: APIDriver
    init(number: String, position: String, points: String, Driver: APIDriver){
        self.number = number
        self.position = position
        self.points = points
        self.Driver = Driver
    }
}
