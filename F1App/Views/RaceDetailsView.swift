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
    var body: some View {
        VStack {
            Picker("What is your favorite color?", selection: $pickView) {
                Text("Qualifing").tag(0)
                Text("Race").tag(1)
                Text("Standings").tag(2)
            }
            .pickerStyle(.segmented)

        }
    }
}


