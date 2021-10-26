//
//  ScheduleListView.swift
//  F1App
//
//  Created by Przemysław Woźny on 26/10/2021.
//

import SwiftUI

struct ScheduleListView: View {
    @ObservedObject var viewScheduleModel: ScheduleViewModel
    var body: some View {
        NavigationView{
            List(viewScheduleModel.scheduleList,id: \.self){races in
                ScheduleView(scheduleModel: races)
            }
        }
    }
}


