//
//  zhbuView.swift
//  Gym rats
//
//  Created by Artem Leschenko on 16.02.2023.
//

import SwiftUI

struct zhbuView: View {
    var missionCalories = ["Скинути", "Утримувати","Набрати"]
    var fastCalories = ["Швидко", "Посередньо","Повільно"]
    @State var selectedMision = 1
    @State var selectedacticitiv = 1.2
    @State var selectedfast = 1
    var body: some View {
        ZStack{
            Color("bgcolor").edgesIgnoringSafeArea(.all)
            VStack{
                Picker("", selection: $selectedMision) {
                    ForEach(0..<missionCalories.count, id: \.self){
                        Text(missionCalories[$0]).tag($0)}
                }.pickerStyle(SegmentedPickerStyle())
                    .background(.gray)
                    .cornerRadius(12)
                    .padding(.top, 70)
                    .padding(.horizontal, 20)
                Picker("", selection: $selectedacticitiv) {
                    Text("Без фізичних навантажень (сидяча робота без тренувань)").tag(1.2)
                    Text("Легка активність (фізичні вправи 1-2 рази в тиждень)").tag(1.375)
                    Text("Середнє навантаження (спорт 3-5 разів на тиждень)").tag(1.55)
                    Text("Активний споіб життя (6-7 тренувань на тиждень)").tag(1.725)
                    Text("Екстремальні навантаження (тренування від 2 разів на день)").tag(1.9)
                }.pickerStyle(MenuPickerStyle())
                    .accentColor(.black)
                    .background()
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                    
                Spacer()
            }
        }
    }
}

struct zhbuView_Previews: PreviewProvider {
    static var previews: some View {
        zhbuView()
    }
}
