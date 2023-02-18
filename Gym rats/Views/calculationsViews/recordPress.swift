//
//  recordPress.swift
//  Gym rats
//
//  Created by Artem Leschenko on 16.02.2023.
//

import SwiftUI

struct recordPress: View {
    
    @State var povtors = 10
    @State var mass = 50
    @State var typeOfBranch = 0
    var types = ["Жим лежачи","Присяд"]
    
    
    var body: some View {
        ZStack{
            Color("bgcolor").edgesIgnoringSafeArea(.all)
            VStack(spacing: 40){
                Picker("", selection: $typeOfBranch) {
                    ForEach(0..<types.count, id: \.self){
                        Text(types[$0]).tag($0)}
                }.pickerStyle(SegmentedPickerStyle())
                    .background(.gray)
                    .cornerRadius(12)
                    .padding(.top, 70)
                    .padding(.horizontal, 20)
                    Text("Введіть вагу та кількість повторів: ")
                    .padding(4)
                    .frame(maxWidth: .infinity)
                    .background()
                    
                VStack{
                    Picker_1(smalltext: "kg", data: $mass, text: "Кілограми: ", range: (10..<200))
                        .padding(.horizontal, 30)
                    Picker_1(smalltext: "р", data: $povtors, text: "Рази:", range: (2..<37))
                        .padding(.horizontal, 30)
                    
                }
                    .padding(3)
                    .background(Color.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                
                VStack(alignment: .leading, spacing: 20){
                    switch typeOfBranch{
                    case 0:
                        Text("Формула Epley: " + String(format: "%.1f", BenchPressEpley(povtors: povtors, mass: mass)))
                        Text("Формула Matt Brzycki: " + String(format: "%.1f", BenchPressBrzycki(povtors: povtors, mass: mass)))
                        Text("Формула Lander: " + String(format: "%.1f", BenchPressLander(povtors: povtors, mass: mass)))
                        Text("Формула Conner: " + String(format: "%.1f", BenchPressConner(povtors: povtors, mass: mass)))
                    case 1:
                        Image(systemName: "xmark")
                            .font(.custom("", size: 100))
                            .foregroundColor(Color.red)
                            .padding(.leading,75)
                            
                        Text("Поки що формули для розрахунків видсутні.")
                            
                    default:
                        Text("None")
                    }
                }.padding()
                    .background()
                    .cornerRadius(12)
                    .font(.custom("", size: 23))
                
                    
                Spacer()
            }
        }
    }
}

struct recordPress_Previews: PreviewProvider {
    static var previews: some View {
        recordPress()
    }
}
