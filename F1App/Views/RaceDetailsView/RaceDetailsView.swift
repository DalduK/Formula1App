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
                    if date.prefix(4) > "1993"{
                    Text("Qualifing").tag(0)
                    Text("Race").tag(1)
                    Text("Standings").tag(2)
                    } else {
                        Text("Race").tag(0)
                        Text("Standings").tag(1)
                    }
                }
                .padding(.horizontal)
                .pickerStyle(.segmented)
                if date.prefix(4) < "1993"{
                    if pickView == 0 {
                        RaceView(viewRaceModel: RaceViewModel(raceService: RaceService(date: date, round: round)))
                    } else {
                        if date.prefix(4) > "1958"{
                        Picker("", selection: $standingView){
                            Text("Drivers").tag(0)
                            Text("Team").tag(1)
                        }.padding(.horizontal).pickerStyle(.segmented)
                        Spacer()
                        }
                        if standingView == 0 {
                            RaceDriverResultsView(viewRaceDriverViewModel: RaceDriverViewModel(raceDriverService: RaceDriverService(date: date, round: round)))
                        } else {
                            RaceStandingResultsView(standingResultViewModel: StandingResultViewModel(standingResultService: StandingResultService(date: date, round: round)))
                        }
                    }
                } else {
                    if pickView == 0{
                        QualiView(viewQualiModel: QualiViewModel(qualiService: QualiService(date: date, round: round)))
                    } else if pickView == 1 {
                        RaceView(viewRaceModel: RaceViewModel(raceService: RaceService(date: date, round: round)))
                    } else {
                        if date.prefix(4) > "1958"{
                        Picker("", selection: $standingView){
                            Text("Drivers").tag(0)
                            Text("Team").tag(1)
                        }.padding(.horizontal).pickerStyle(.segmented)
                        Spacer()
                        }
                        if standingView == 0 {
                            RaceDriverResultsView(viewRaceDriverViewModel: RaceDriverViewModel(raceDriverService: RaceDriverService(date: date, round: round)))
                        } else {
                            RaceStandingResultsView(standingResultViewModel: StandingResultViewModel(standingResultService: StandingResultService(date: date, round: round)))
                        }
                    }
                }
                
            }

        }
        .navigationTitle(raceName).navigationBarTitleDisplayMode(.inline)
    }
}


