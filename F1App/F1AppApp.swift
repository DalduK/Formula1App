//
//  F1AppApp.swift
//  F1App
//
//  Created by Przemysław Woźny on 23/10/2021.
//

import SwiftUI

@main
struct F1AppApp: App {
    @ObservedObject var viewModel = DriverViewModel(driverService: DriverService())
    @ObservedObject var viewScheduleModel = ScheduleViewModel(scheduleService: ScheduleService())
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel,scheduleModel: viewScheduleModel)
        }
    }
}
