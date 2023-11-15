//
//  ScheduleViewModel.swift
//  F1App
//
//  Created by Przemysław Woźny on 26/10/2021.
//

import Foundation

public class ScheduleViewModel: ObservableObject {
    @Published var scheduleList: [Schedule] = []
    
    public let scheduleService: ScheduleService
    
    public init(scheduleService: ScheduleService){
        self.scheduleService = scheduleService
    }
    
    public func refresh(){
        scheduleService.loadScheduleData(){ schedule in
            DispatchQueue.main.async{
                self.scheduleList = schedule.schedule
            }
        }
    }
}
