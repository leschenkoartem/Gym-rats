//
//  tabBar.swift
//  Gym rats
//
//  Created by Artem Leschenko on 16.02.2023.
//

import SwiftUI

struct calculationsView: View {
    @Environment(\.dismiss) var dismiss
    @State var tab:Tab = .carrot
    
    
    var body: some View {
        
        
        ZStack {
            VStack{
                TabView(selection: $tab) {
                    switch tab{
                    case .carrot:
                        zhbuView()
                    case .trophy:
                        recordPress()
                    }
                }
            }
            
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
                
                Spacer()
                CustomTabBar(selectedTab: $tab)
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}
struct calculationsView_Previews: PreviewProvider {
    static var previews: some View {
        calculationsView().environmentObject(User())
    }
}

