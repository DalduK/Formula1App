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
                print(race.raceName)
            self.schedule.append(Schedule(response: race))
        }
    }
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
        self.time = response.time
    }
}
