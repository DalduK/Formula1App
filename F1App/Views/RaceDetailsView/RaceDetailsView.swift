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
    var raceName: String
    @State var pickView = 0
    @State var standingView = 0
    @State private var showIt = false
    var body: some View {
        VStack {
            if date.prefix(4) == "2022" {
                Button("Events") { showIt = true }
                            .sheet(isPresented: $showIt) {
                                NewEventGenerator(isShowing: $showIt)
                            }
            } else {
                Picker("", selection: $pickView) {
                    Text("Qualifing").tag(0)
                    Text("Race").tag(1)
                    Text("Standings").tag(2)
                }
                .padding(.horizontal)
                .pickerStyle(.segmented)
                if pickView == 0{
                    if date.prefix(4) > "1993"{
                        QualiView(viewQualiModel: QualiViewModel(qualiService: QualiService(date: date, round: round)))
                    } else {
                        Spacer()
                        Text("No info about qualifiyng before 1993")
                        Spacer()
                    }
                } else if pickView == 1 {
                    RaceView(viewRaceModel: RaceViewModel(raceService: RaceService(date: date, round: round)))
                } else {
                    Picker("", selection: $standingView){
                        Text("Drivers").tag(0)
                        Text("Team").tag(1)
                    }.padding(.horizontal).pickerStyle(.segmented)
                    Spacer()
                    if standingView == 0 {
                        RaceDriverResultsView(viewRaceDriverViewModel: RaceDriverViewModel(raceDriverService: RaceDriverService(date: date, round: round)))
                    } else {
                        Text("Hey")
                    }
                }
            }

        }
        .navigationTitle(raceName).navigationBarTitleDisplayMode(.inline)
    }
}


