//
//  ScheduleCalendarView.swift
//  F1App
//
//  Created by Przemysław Woźny on 21/01/2022.
//

import SwiftUI

struct ScheduleCalendarView: View {
    var dateTime: String
    var raceName: String
    var time: String
    var round: String
    @State private var showIt = false
    @State private var birthDate: Date = Date()
    init(dateTime: String, raceName: String, time: String,  round: String){
        self.dateTime = dateTime
        self.time = time
        self.raceName = raceName
        self.round = round
        _birthDate = State(initialValue: returnDate(dateTime: dateTime))
        print(birthDate)
    }
    
    func returnDate(dateTime: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:dateTime)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
        guard let finalDate = calendar.date(from:components) else { return Date() }
        return finalDate
    }
    
    var body: some View {
        VStack{
            ZStack{
            DatePicker(selection: $birthDate) {
                Text("\(String(time.prefix(5)))")
            }
            .padding(10)
                        .labelsHidden()
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .background(Color("LightGrayColor")).cornerRadius(20)
            }.padding(20).shadow(radius: 19)
            
            HStack{
            Text("Add Race To calendar")
                Spacer()
            Button("Events") {
                showIt = true
            }
            .sheet(isPresented: $showIt) {
                NewEventGenerator(isShowing: $showIt)
            }
            }.padding(.horizontal,20)
            Spacer()
        }.navigationBarTitleDisplayMode(.large)
    }
}
