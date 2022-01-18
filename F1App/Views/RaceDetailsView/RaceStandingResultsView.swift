//
//  RaceStandingResultsView.swift
//  F1App
//
//  Created by Przemysław Woźny on 17/01/2022.
//

import SwiftUI

struct RaceStandingResultsView: View {
    @ObservedObject var viewRaceDriverViewModel: RaceDriverViewModel
    var body: some View {
        List(viewRaceDriverViewModel.driverStandingsList, id: \.position){ driver in
            HStack{
                Text("\(driver.position).\(driver.Driver.familyName)")
                Spacer()
                Text("\(driver.points)")
            }.listRowBackground(driver.position == "1" ? Color(red: 1, green: 223/255, blue: 0) : driver.position == "2" ? Color(red: 192/255, green: 192/255, blue: 192/255) : driver.position == "3" ? Color(red: 176/255, green: 141/255, blue: 87/255) : Color.white)
        }.onAppear(perform: viewRaceDriverViewModel.refresh).navigationViewStyle(.stack)
    }
}

