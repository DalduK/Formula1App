//
//  RaceDetailsView.swift
//  F1App
//
//  Created by Przemysław Woźny on 26/10/2021.
//

import SwiftUI

struct RaceDetailsView: View {
    var date: String
    var round: String
    @State var pickView = 0
    @State var standingView = 0
    var body: some View {
        VStack {
            if date.prefix(4) == "2022" {
                Text("New Season")
            } else {
                Text(date)
                Text(round)
                Picker("", selection: $pickView) {
                    Text("Qualifing").tag(0)
                    Text("Race").tag(1)
                    Text("Standings").tag(2)
                }
                .padding(.horizontal)
                .pickerStyle(.segmented)
                if pickView == 0{
                    Text("Quali")
                } else if pickView == 1 {
                    Text("Race")
                } else {
                    Picker("", selection: $standingView){
                        Text("Drivers").tag(0)
                        Text("Team").tag(1)
                    }.padding(.horizontal).pickerStyle(.segmented)
                    Spacer()
                    Text("Standings")
                }
            }

        }
    }
}


