//
//  ScheduleListView.swift
//  F1App
//
//  Created by Przemysław Woźny on 26/10/2021.
//

import SwiftUI

struct ScheduleListView: View {
    @ObservedObject var viewScheduleModel: ScheduleViewModel
    @State var date = 2021
    var body: some View {
        NavigationView{
            List(viewScheduleModel.scheduleList,id: \.self){races in
                ScheduleView(scheduleModel: races)
            }.navigationBarTitle("RaceSchedule")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Picker("Select a paint color", selection: $date) {
                            ForEach((1950...2022).reversed(), id: \.self) {
                                Text(verbatim: "\($0)")
                            }
                        }
                        .onChange(of: date) { _ in
                            self.viewScheduleModel.scheduleService.updateDate(date: date)
                            self.viewScheduleModel.refresh()
                        }
                        .pickerStyle(.menu)
                    }
                }
        }
    }
}


