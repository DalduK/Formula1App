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
                HStack{
                    Text("Driver List").font(.largeTitle)
                        .fontWeight(.bold).padding(.leading,20)
                        .padding(.top,20)
                    if !loading {
                        ProgressView().padding(.leading,20).padding(.top,20)
                    }
                    
                    Spacer()
                    Picker("Select a paint color", selection: $date) {
                        ForEach((1950...2022).reversed(), id: \.self) {
                            Text(verbatim: "\($0)")
                        }
                    }
                    .onChange(of: date) { _ in
                        self.viewDriverModel.driverService.updateDate(date: date)
                        self.viewDriverModel.refresh()
                    }
                    .pickerStyle(.menu)
                    .padding(.trailing, 20).padding(.top,20)
                }
                List(viewDriverModel.driverList,id: \.self){driver in
                    DriverView(driverModel: driver)
                }.navigationBarTitle("")
                    .navigationBarHidden(true)
            }.onChange(of: viewDriverModel.driverList){ value in
                guard (value != []) else {return}
                loading = true
            }
        }
    }
}


