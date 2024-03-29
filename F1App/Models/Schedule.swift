//
//  Schedule.swift
//  F1App
//
//  Created by Przemysław Woźny on 23/10/2021.
//

import Foundation

public struct ScheduleList{
    var schedule: [Schedule] = []
    init(response: RaceTable){
            for race in response.Races{
            self.schedule.append(Schedule(response: race))
        }
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
    let time: String?
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

public struct Schedule: Hashable {
    let season: String
    let round: String
    let raceName: String
    let circuitName: String
    let url: String
    let lat: String
    let long: String
    let locality: String
    let country: String
    let date: String
    let time: String
    init(response: APISchedule){
        self.season = response.season
        self.round = response.round
        self.raceName = response.raceName
        self.circuitName = response.Circuit.circuitName
        self.url = response.url
        self.lat = response.Circuit.Location.lat
        self.long = response.Circuit.Location.long
        self.locality = response.Circuit.Location.locality
        self.country = response.Circuit.Location.country
        self.date = response.date
        self.time = response.time ?? ""
    }
}
