//
//  QualiView.swift
//  F1App
//
//  Created by Przemysław Woźny on 17/01/2022.
//

import SwiftUI

struct QualiView: View {
    @ObservedObject var viewQualiModel: QualiViewModel
    var body: some View {
        List(viewQualiModel.qualiList, id: \.number){ driver in
            HStack{
                Text(driver.Driver.familyName)
                Spacer()
                if driver.Q3 != nil{
                    Text("Q3: \(driver.Q3 ?? "" )")
                        .fontWeight(.bold)
                } else if driver.Q2 != nil {
                    Text("Q2: \(driver.Q2 ?? "" )")
                        .fontWeight(.bold)
                } else if driver.Q1 == ""{
                    Text("Q1: no time")
                        .fontWeight(.bold)
                } else {
                    Text("Q1: \(driver.Q1)")
                        .fontWeight(.bold)
                }
            }.listRowBackground(driver.Q3 != nil ? Color.green : driver.Q2 != nil ? Color.yellow : Color.white)
        }.onAppear(perform: viewQualiModel.refresh).navigationViewStyle(.stack)
    }
}

