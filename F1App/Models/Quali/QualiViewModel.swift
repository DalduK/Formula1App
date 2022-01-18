//
//  QualiViewModel.swift
//  F1App
//
//  Created by Przemysław Woźny on 18/01/2022.
//

import Foundation
public class QualiViewModel: ObservableObject {
    @Published var qualiList: [QualiResult] = []
    
    public let qualiService: QualiService
    
    public init(qualiService: QualiService){
        self.qualiService = qualiService
        refresh()
    }
    
    public func refresh(){
        qualiService.loadDriverData(){ quali in
            DispatchQueue.main.async{
                self.qualiList = quali[0].QualifyingResults
            }
        }
    }
}
