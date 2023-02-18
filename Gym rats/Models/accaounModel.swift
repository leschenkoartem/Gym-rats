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
    @Published var age = 17
    @Published var height = 186
    @Published var weight = 86.0
    
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
        get{return String(format: "%.1f",weight/(pow(Double(height)/100, 2)))}
    }
   
    var firstlatterName:Character{
        get{return name.first ?? "0"}
    }
}
