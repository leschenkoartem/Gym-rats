//
//  accaounModel.swift
//  Gym rats
//
//  Created by Artem Leschenko on 10.02.2023.
//

import Foundation


class User: ObservableObject {
    @Published var name:String = "Artem"
    @Published var lastName = "Leschenko"
    @Published var userOld = 20
    @Published var userHeight = 180
    @Published var userWeight = 60.0
    
    var firstlatterName:Character{
        get{return name.first ?? "0"}
    }
}
