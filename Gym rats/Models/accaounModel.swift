//
//  accaounModel.swift
//  Gym rats
//
//  Created by Artem Leschenko on 10.02.2023.
//

import Foundation


class User: ObservableObject {
    @Published var name:String = (UserDefaults.standard.string(forKey: "name") ?? "")
    @Published var lastName =  (UserDefaults.standard.string(forKey: "lastName") ?? "")
    @Published var maleInt = UserDefaults.standard.integer(forKey: "maleInt")
    @Published var age = UserDefaults.standard.integer(forKey: "age")
    @Published var height = UserDefaults.standard.integer(forKey: "height")
    @Published var weight = UserDefaults.standard.double(forKey: "weight")
    
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
    
    func setDeafult(){
        UserDefaults.standard.set(self.name, forKey: "name")
        UserDefaults.standard.set(self.lastName, forKey: "lastName")
        UserDefaults.standard.set(self.maleInt, forKey: "maleInt")
        UserDefaults.standard.set(self.age, forKey: "age")
        UserDefaults.standard.set(self.height, forKey: "height")
        UserDefaults.standard.set(self.weight, forKey: "weight")
    }
    
    
}
