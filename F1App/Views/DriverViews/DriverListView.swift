//
//  DriverView.swift
//  F1App
//
//  Created by Przemysław Woźny on 23/10/2021.
//

import Foundation
import SwiftUI


struct DriverListView: View {
    @ObservedObject var viewDriverModel: DriverViewModel
    @State var date = 2021
    @State var loading = false
    var body: some View {
        NavigationView{
            VStack{
                List(viewDriverModel.driverList,id: \.self){driver in
                    DriverView(driverModel: driver)
                }.navigationBarTitle("Driver List")
                    .toolbar(content: {
                        ToolbarItem(placement: .navigationBarTrailing, content: {
                            Picker("", selection: $date) {
                                ForEach((1950...2022).reversed(), id: \.self) {
                                    Text(verbatim: "\($0)")
                                }
                            }
                            .onChange(of: date) { _ in
                                self.viewDriverModel.driverService.updateDate(date: date)
                                self.viewDriverModel.refresh()
                            }
                            .pickerStyle(.menu)
                        })
                    })
            }.onChange(of: viewDriverModel.driverList){ value in
                guard (value != []) else {return}
                loading = true
            }
        }
    }
}


