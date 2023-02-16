//
//  calculationsViewModel.swift
//  Gym rats
//
//  Created by Artem Leschenko on 16.02.2023.
//

import Foundation

//формуди для жима лежачи
func BenchPressEpley(povtors:Int, mass:Int)->Double{
    return (Double(mass)*Double(povtors))/30.0+Double(mass)
}

func BenchPressBrzycki(povtors:Int, mass:Int)->Double{
    return Double(mass)*(36.0/(37.0-Double(povtors)))
}

func BenchPressLander(povtors:Int, mass:Int)->Double{
    return (100 * Double(mass)) / (101.3 - 2.67123 * Double(povtors))
}

func BenchPressConner(povtors:Int, mass:Int)->Double{
    return  Double(mass) * (1 + 0.025 *  Double(povtors))
}

//Підрахунок калорій

