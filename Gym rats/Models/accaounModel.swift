//
//  accaounModel.swift
//  Gym rats
//
//  Created by Artem Leschenko on 10.02.2023.
//

import Foundation


class User: ObservableObject {
    @Published var name:String = ""
    @Published var lastName = ""
    @Published var maleInt = 1
    @Published var userOld = 27
    @Published var userHeight = 170
    @Published var userWeight = 75.0
    
    var maleString:String{
        get{
            if maleInt == 1{
                return "Man"
            }else{
                return "Woman"
            }
        }
    }
    
    var BodyMI:String{
        get{return String(format: "%.1f",userWeight/(pow(Double(userHeight)/100, 2)))}
    }
   
    var firstlatterName:Character{
        get{return name.first ?? "0"}
    }
}
