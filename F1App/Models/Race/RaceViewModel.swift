//
//  RaceViewModel.swift
//  F1App
//
//  Created by Przemysław Woźny on 18/01/2022.
//

import Foundation
public class RaceViewModel: ObservableObject {
    @Published var raceList: [RaceResult] = []
    
    public let raceService: RaceService
    
    public init(raceService: RaceService){
        self.raceService = raceService
        refresh()
    }
    
    public func refresh(){
        raceService.loadDriverData(){ race in
            DispatchQueue.main.async{
                self.raceList = race[0].Results
            }
        }
    }
}
