//
//  StandingResultViewModel.swift
//  F1App
//
//  Created by Przemysław Woźny on 20/01/2022.
//

import Foundation

public class StandingResultViewModel: ObservableObject {
    @Published var standingResultList: [ConstructorStandings] = []
    
    public let standingResultService: StandingResultService
    
    public init(standingResultService: StandingResultService){
        self.standingResultService = standingResultService
        refresh()
    }
    
    public func refresh(){
        standingResultService.loadDriverData(){ constructor in
            DispatchQueue.main.async{
                self.standingResultList = constructor
            }
        }
    }
}
