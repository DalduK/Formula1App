//
//  RaceStandingResultsView.swift
//  F1App
//
//  Created by Przemysław Woźny on 17/01/2022.
//

import SwiftUI

struct RaceStandingResultsView: View {
    @ObservedObject var standingResultViewModel: StandingResultViewModel
    var body: some View {
        List(standingResultViewModel.standingResultList, id: \.position){ constructor in
            HStack{
                Text("\(constructor.position).\(constructor.Constructor.name)")
                Spacer()
                Text("\(constructor.points)")
            }.listRowBackground(constructor.position == "1" ? Color(red: 1, green: 223/255, blue: 0) : constructor.position == "2" ? Color(red: 192/255, green: 192/255, blue: 192/255) : constructor.position == "3" ? Color(red: 176/255, green: 141/255, blue: 87/255) : Color.white)
        }.onAppear(perform: standingResultViewModel.refresh).navigationViewStyle(.stack)
    }
}

