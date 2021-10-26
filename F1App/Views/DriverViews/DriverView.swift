//
//  DriverView.swift
//  F1App
//
//  Created by Przemysław Woźny on 24/10/2021.
//

import Foundation
import SwiftUI

private let iconMap = [
    "Spanish" : "🇪🇸",
    "British" : "🇬🇧",
    "Polish" : "🇵🇱",
    "Canadian" : "🇨🇦",
    "Russian" : "🇷🇺",
    "Australian" : "🇦🇺",
    "German" : "🇩🇪",
    "Dutch" : "🇳🇱",
    "Argentine" : "?",
    "Austria" : "?",
    "Belgium" : "?",
    "Brazilian" : "?",
    "Chile" : "?",
    "Colombian" : "?",
    "Czech" : "?",
    "Denmark" : "?",
    "Finnish" : "🇫🇮",
    "French" : "🇫🇷",
    "Hungary" : "?",
    "India" : "?",
    "Indonesia" : "?",
    "Italian" : "🇮🇹",
    "Irland" : "?",
    "Japanese" : "🇯🇵",
    "Liechtenstein" : "?",
    "Malaysian" : "?",
    "Mexican" : "🇲🇽",
    "Monegasque" : "?",
    "Moroccan" : "?",
    
]

struct DriverView: View {
    let driverModel: Driver
    var body: some View {
        NavigationLink(destination: WebView(requestURL: URLRequest(url: URL(string: driverModel.url)!))){
            HStack{
                VStack{
                    HStack{
                        Text("\(driverModel.givenNeme) \(driverModel.familyName) \(iconMap[driverModel.nationality] ?? "")").fontWeight(.heavy)
                        Spacer()
                    }
                    HStack{
                        Text("Age: \(driverModel.age)").fontWeight(.light)
                        Spacer()
                    }
                }
                Spacer()
                Text(driverModel.permanentNumber).font(.largeTitle)
            }
        }
    }
}
