//
//  DriverViewModel.swift
//  F1App
//
//  Created by Przemysław Woźny on 23/10/2021.
//

import Foundation

public class DriverViewModel: ObservableObject {
    @Published var driverList: [Driver] = []
    
    public let driverService: DriverService
    
    public init(driverService: DriverService){
        self.driverService = driverService
    }
    
    public func refresh(){
        driverService.loadDriverData(){ driver in
            DispatchQueue.main.async{
                self.driverList = driver.drivers
            }
        }
    }
}
