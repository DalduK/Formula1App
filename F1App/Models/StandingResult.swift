//
//  StandingResult.swift
//  F1App
//
//  Created by Przemysław Woźny on 20/01/2022.
//

import Foundation

public struct APIResponseStandingResult: Decodable{
    let MRData: StandingResult
}

public struct StandingResult: Decodable{
    let StandingsTable: StandingsTables
}

public struct StandingsTables: Decodable{
    let season: String
    let StandingsLists: [StandingsLists]
}

public struct StandingsLists: Decodable{
    let season: String
    let ConstructorStandings: [ConstructorStandings]
}

public struct ConstructorStandings: Decodable{
    let position: String
    let points: String
    let Constructor: Constructor
    init(position: String, points: String, Constructor: Constructor){
        self.position = position
        self.points = points
        self.Constructor = Constructor
    }
}

public struct Constructor: Decodable {
    let constructorId: String
    let url: String
    let name: String
    let nationality: String
}
