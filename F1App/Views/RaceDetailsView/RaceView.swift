//
//  RaceView.swift
//  F1App
//
//  Created by Przemysław Woźny on 17/01/2022.
//

import SwiftUI

struct RaceView: View {
    @ObservedObject var viewRaceModel: RaceViewModel
    var body: some View {
        List(viewRaceModel.raceList, id: \.number){ driver in
            HStack{
                Text("\(driver.position).\(driver.Driver.familyName)")
                Spacer()
                if driver.points != "0" {
                    Text("+\(driver.points)")
                }
            }.listRowBackground(driver.position == "1" ? Color(red: 1, green: 223/255, blue: 0) : driver.position == "2" ? Color(red: 192/255, green: 192/255, blue: 192/255) : driver.position == "3" ? Color(red: 176/255, green: 141/255, blue: 87/255) : driver.points != "0" ? Color.green : Color.white)
        }.onAppear(perform: viewRaceModel.refresh).navigationViewStyle(.stack)
    }
}

