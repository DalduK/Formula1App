//
//  Quali.swift
//  F1App
//
//  Created by Przemysław Woźny on 18/01/2022.
//

import Foundation



public struct APIResponseQuali: Decodable{
    let MRData: GenericDataQuali
}

public struct GenericDataQuali: Decodable{
    let RaceTable: RaceQualiTable
}

public struct RaceQualiTable: Decodable{
    let season: String
    let Races: [RaceQualiData]
}

public struct RaceQualiData: Decodable{
    let date: String
    let raceName: String
    let QualifyingResults: [QualiResult]
}

public struct QualiResult: Decodable{
    let number: String
    let Driver: APIDriver
    let Q1: String
    let Q2: String?
    let Q3: String?
    init(number: String, Driver: APIDriver, Q1: String, Q2: String, Q3: String){
        self.number = number
        self.Driver = Driver
        self.Q1 = Q1
        self.Q2 = Q2
        self.Q3 = Q3
    }
    
    init(number: String, Driver: APIDriver, Q1: String, Q2: String){
        self.number = number
        self.Driver = Driver
        self.Q1 = Q1
        self.Q2 = Q2
        self.Q3 = "0"
    }
    
    init(number: String, Driver: APIDriver, Q1: String){
        self.number = number
        self.Driver = Driver
        self.Q1 = Q1
        self.Q2 = "0"
        self.Q3 = "0"
    }
}
