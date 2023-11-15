//
//  Driver.swift
//  F1App
//
//  Created by Przemysław Woźny on 23/10/2021.
//

import Foundation
import SwiftUI

public struct DriverList{
    var drivers: [Driver] = []
    init(response: DriverTable){
        for driver in response.Drivers{
            self.drivers.append(Driver(response: driver))
        }
    }
}

public struct APIResponse: Decodable{
    let MRData: GenericData
}

public struct GenericData: Decodable{
    let xmlns: String
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let DriverTable: DriverTable
}

public struct DriverTable: Decodable{
    let season: String
    let Drivers: [APIDriver]
}

public struct APIDriver: Decodable{
    let driverId: String
    let permanentNumber: String?
    let code: String?
    let url: String?
    let givenName: String
    let familyName: String
    let dateOfBirth: String
    let nationality: String
}


public struct Driver: Hashable{
    let driverId: String
    let permanentNumber: String
    let code: String
    let url: String
    let givenNeme: String
    let familyName: String
    let age: Int
    let nationality: String
    init(response: APIDriver) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let birthday = dateFormatter.date(from:response.dateOfBirth)!
        let now = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        let age = ageComponents.year!
        self.driverId = response.driverId
        self.permanentNumber = response.permanentNumber ?? ""
        self.code = response.code ?? ""
        self.url = response.url ?? ""
        self.givenNeme = response.givenName
        self.familyName = response.familyName
        self.age = age
        self.nationality = response.nationality
    }
}
