//
//  ScheduleView.swift
//  F1App
//
//  Created by Przemysław Woźny on 26/10/2021.
//

import SwiftUI
import MapKit

struct ScheduleView: View {
    let scheduleModel: Schedule
    var body: some View {
        NavigationLink(destination: RaceDetailsView(date: scheduleModel.date, time: scheduleModel.time, round: scheduleModel.round, raceName: scheduleModel.raceName)){
            HStack{
                VStack{
                    HStack{
                        Text("\(scheduleModel.raceName)").fontWeight(.heavy)
                        Spacer()
                    }
                    HStack{
                        Text("\(scheduleModel.country)").fontWeight(.light)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                    Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(scheduleModel.lat)!, longitude: Double(scheduleModel.long)!), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))), interactionModes: []).frame(width: 300, height: 200)
                        .cornerRadius(20)
                        .shadow(radius: 19)
                        Spacer()
                    }
                }
                Spacer()
            }
        }
    }
}

