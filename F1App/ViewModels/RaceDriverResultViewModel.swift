//
//  RaceDriverResultViewModel.swift
//  F1App
//
//  Created by Przemysław Woźny on 18/01/2022.
//

import Foundation

public class RaceDriverViewModel: ObservableObject {
    @Published var driverStandingsList: [DriverStandings] = []
    
    public let raceDriverService: RaceDriverService
    
    public init(raceDriverService: RaceDriverService){
        self.raceDriverService = raceDriverService
        print(self.driverStandingsList)
        refresh()
    }
    
    public func refresh(){
        raceDriverService.loadDriverData(){ race in
            DispatchQueue.main.async{
                self.driverStandingsList = race
            }
        }
    }
}
