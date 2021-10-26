//
//  ContentView.swift
//  F1App
//
//  Created by Przemysław Woźny on 23/10/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    let viewModel: DriverViewModel
    let scheduleModel: ScheduleViewModel
    var body: some View {
        TabView(selection: $selectedTab){
            DriverListView(viewDriverModel: viewModel).tabItem {
                Label("Drivers", systemImage: "list.dash")
            }.tag(0).onAppear(perform:viewModel.refresh)
            ScheduleListView(viewScheduleModel: scheduleModel).tabItem{
                Label("Schedule", systemImage: "calendar")
            }.tag(1).onAppear(perform: scheduleModel.refresh)
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
