//
//  zhbuView.swift
//  Gym rats
//
//  Created by Artem Leschenko on 16.02.2023.
//

import SwiftUI

struct zhbuView: View {
    @EnvironmentObject var user:User
    @State var selectedMision = 0
    @State var selectedacticitiv = 1.55
    @State var selectedfast = 250
    var body: some View {
        
        let kkal = calcKkal(Mission: Double(selectedMision), activity: Double(selectedacticitiv), fast: Double(selectedfast), Male: Double(user.maleInt), weight: Double(user.weight), Age: Double(user.age), height: Double(user.height))
        
        ZStack{
            Color("bgcolor").edgesIgnoringSafeArea(.all)
            VStack{
                
                
                Picker("", selection: $selectedMision) {
                    Text("Скинути").tag(-1)
                    Text("Утримати").tag(0)
                    Text("Набрати").tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                    .background(.gray)
                    .cornerRadius(12)
                    .padding(.top, 70)
                    .padding(.horizontal, 20)
                
                
                Picker("", selection: $selectedacticitiv) {
                    Text("Без фізичних навантажень (без навантажень)").tag(1.2)
                    Text("Легка активність (фізичні вправи 1-2 рази в тиждень)").tag(1.375)
                    Text("Середнє навантаження (спорт 3-5 разів на тиждень)").tag(1.55)
                    Text("Активний споіб життя (6-7 тренувань на тиждень)").tag(1.725)
                    Text("Екстремальні навантаження (2+ в день)").tag(1.9)
                }.pickerStyle(MenuPickerStyle())
                    .background()
                    .foregroundColor(Color.black)
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                
                
                Picker("", selection: $selectedfast) {
                    if selectedMision == -1 || selectedMision == 1{
                        Text("Повільно").tag(250)
                        Text("Нормально").tag(500)
                        Text("Щвидко").tag(750)
                    }else{
                        Text("Стандартна форма утримування").tag(0)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .background(.gray)
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                
                
                VStack(spacing: 30){
                    
                    ZStack{
                        Circle()
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 100)
                        Text("\(Int(kkal))")
                            .font(.custom("", size: 22))
                            
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(){
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Білки:")
                                Text("Жири:")
                                Text("Вуглеводи:")
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 20) {
                                Text("\(Int(kkal*0.2/4))")
                                Text("\(Int(kkal*0.3/9))")
                                Text("\(Int(kkal*0.5/4))")
                            }.padding(.trailing, 10)
                            
                        }.padding()
                            .frame(maxWidth: .infinity)
                            .background()
                            .cornerRadius(12)
                            .padding(.horizontal, 30)
                            .font(.custom("", size: 23))
                        }
                    
                    Text("Розрахунки за даними ваги (\(String(format: "%.1f", user.weight))кг), віку (\(user.age)р), росту (\(user.height)см) та статі (\(user.maleString)) користувача ").padding(.horizontal, 30)
                        .padding(.top, -20)
                        .font(.custom("", size: 15))
                    
                }.padding(.top,30)
                
                
                Spacer()
            }
        }
    }
}

struct zhbuView_Previews: PreviewProvider {
    static var previews: some View {
        zhbuView().environmentObject(User())
    }
}
