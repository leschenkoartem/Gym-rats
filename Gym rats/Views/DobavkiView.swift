//
//  DobavkiView.swift
//  Gym rats
//
//  Created by Artem Leschenko on 19.02.2023.
//

import SwiftUI

struct DobavkiView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color("bgcolor").edgesIgnoringSafeArea(.all)
            
            
            VStack{
                
                
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Text("\(Image(systemName: "arrow.backward")) Назад")
                            .padding(10)
                            .background()
                            .cornerRadius(12)
                            .padding(.leading, 10)
                            .foregroundColor(.black)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                
                if #available(iOS 16.0, *) {
                    
                    ScrollView(.vertical){
                        
                        scrolElement(text: "Для набору маси", array: mass_dobavki)
                        
                        scrolElement(text: "Для схуднення", array: lw_dobavki)
                        
                        scrolElement(text: "Для підтрфмання здоров'я", array: health_dobavki)
                        
                    }.scrollIndicators(.hidden)
                    
                }
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct DobavkiView_Previews: PreviewProvider {
    static var previews: some View {
        DobavkiView()
    }
}


struct scrolElement: View {
    var text:String
    var array:Array<Dobavki>
    var body: some View {
        Text(text)
            .padding(6)
            .frame(maxWidth: .infinity)
            .font(.custom("", size: 20))
            .background()
        
        if #available(iOS 16.0, *) {
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<array.count){item in
                        array[item]
                    }
                }
            }.scrollIndicators(.hidden)
                .frame(minHeight: 520)
        } else {
            // Fallback on earlier versions
        }
        
    }
}
