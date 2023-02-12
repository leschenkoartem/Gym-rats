//
//  AccountView.swift
//  Gym rats
//
//  Created by Artem Leschenko on 12.02.2023.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var user:User
    
    @Binding var isSheet:Bool
    var color_:Color
    var body: some View {
        ZStack{
            Color("bgcolor").edgesIgnoringSafeArea(.all)
            ZStack{
        

                Button {
                    isSheet.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.custom("", size: 30))
                        .padding(.top, 10)
                        .padding(.horizontal, 10)
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)

                
            }
            VStack{
                ZStack{
                    Circle()
                            .foregroundColor(color_)
                            .frame(maxWidth: 70)
                    Text("\(String(user.firstlatterName))")
                        .foregroundColor(.white)
                        .font(.custom("", size: 50))
                }.padding(.top, 20)
                Text(user.name + " " + user.lastName)
                    .font(.custom("", size: 25))
                    .foregroundColor(.white)
                Rectangle()
                    .frame(width: 300, height: 2)
                    .background(Color.white)
                listAccountView(info: "Weight", value: "\(String(format: "%.1f", user.userWeight)) kg")
                listAccountView(info: "Height:", value: "\(user.userHeight) cm")
                listAccountView(info: "Old:", value: "\(user.userOld) years")
                Spacer()
            
            
            
            }
            }
        
        }
    }


struct AccountView_Previews: PreviewProvider {
    @State static var value = false
    static var previews: some View {
        AccountView(isSheet: $value, color_: .black).environmentObject(User())
    }
}
