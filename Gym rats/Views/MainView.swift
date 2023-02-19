//
//  ContentView.swift
//  Gym rats
//
//  Created by Artem Leschenko on 10.02.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var user : User
    @State var selected = 2
    @State var information = false
    @State var isSheet = false
    var color_ = Color.random
    
    
    var body: some View {

        NavigationView {
            
            ZStack{
                
                Color("bgcolor").edgesIgnoringSafeArea(.all)
    
                ZStack{
                    
                    HStack{
                        
                        Button {
                            isSheet.toggle()
                        } label: {
                            HStack{
                                
                                ZStack{
                                    
                                    Circle()
                                        .foregroundColor(color_)
                                        .frame(maxWidth: 46)
                                    
                                    Text("\(String(user.firstlatterName))")
                                        .foregroundColor(.white)
                                        .font(.custom("", size: 30))
                                }
                                
                                Text(user.name + " " + user.lastName )
                                    .padding(.trailing, 13)
                                
                            }.padding(2)
                                .background()
                                .cornerRadius(100)
                                .padding(.leading)
                                .foregroundColor(.black)
                                .shadow(color: .black, radius: 5, y: 3)
                            
                        }
                        
                        Spacer()
                        
                        Button {
                            information.toggle()
                        } label: {
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                                .font(.custom("", size: 30))
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                                .shadow(color: .black, radius: 12)
                        }
                        
                    }
          
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .sheet(isPresented: $isSheet) {
                        
                        if #available(iOS 16.0, *) {
                            AccountView(isSheet: $isSheet, color_: color_)
                                .presentationDetents([.fraction(0.40), .fraction(0.45)])
                        } else {
                            AccountView(isSheet: $isSheet, color_: color_)
                        }   
                    }
                
                VStack(spacing: 30){
                    
                    NavigationLink{calculationsView()
                    } label: {
                            Text("Калькулятори")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background()
                                .cornerRadius(12)
                                .foregroundColor(.indigo)
                                .padding(.horizontal, 50)
                                .shadow(color: .black, radius: 8, y: 5)
                        
                    }
                    
                    NavigationLink{DobavkiView()} label: {
                            Text("Спортивні добавки")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background()
                                .cornerRadius(12)
                                .foregroundColor(.indigo)
                                .padding(.horizontal, 50)
                                .shadow(color: .black, radius: 8, y: 5)
                        
                    }
                    Nav_link(view: InformationView(), text: "Здорове харчування")
                    
                }
                
                ZStack{
                    
                    HStack{
                        
                        Text("Made by:")
                            .foregroundColor(.indigo)
                        
                        Link(destination: URL(string: "https://www.instagram.com/leschenko___/")!) {
                            Text("leschenko___").foregroundColor(.red)
                            Text("(clickable)")
                            
                        }
                    }.padding(8)
                        .frame(maxWidth: .infinity)
                        .background()
                        .shadow(color: .black, radius: 12)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding(.bottom, 16)
                }
            }
                     
        }.fullScreenCover(isPresented: $information) {
            InformationView()
                .background(Color("bgcolor"))
                .accentColor(.indigo)
                
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(User())
    }
}
