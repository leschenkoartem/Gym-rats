//
//  registrationView.swift
//  Gym rats
//
//  Created by Artem Leschenko on 10.02.2023.
//

import SwiftUI

struct InformationView: View {
    
    @State var confirmDialog = false
    @EnvironmentObject var user: User
    @Environment(\.dismiss) var dismiss
    @State var isAlert = false
    @State var textalert = ""
    
    
    var body: some View {
        ZStack{
            Color("bgcolor").edgesIgnoringSafeArea(.all)
            VStack {
                
                ZStack{
                    Text("")
                        .frame(maxWidth: .infinity)
                        .background()
                    
                    Text("INFORMATION")
                        .padding()
                        .background()
                        .cornerRadius(12)
                        .shadow(color: .black, radius: 10)
                }.padding(.bottom, -25)
                
                
                Form(){
                    
                    Section(header: Text("How can you be contacted?").frame(maxWidth: .infinity)){
                        TextField("Name ...", text: $user.name)
                            .textInputAutocapitalization(.words)
                            .autocorrectionDisabled(true)
                            .keyboardType(.alphabet)
                        TextField("Lastname ...", text: $user.lastName)
                            .textInputAutocapitalization(.words)
                            .autocorrectionDisabled(true)
                            .keyboardType(.alphabet)
                    }
                    
                    Section(header: Text("what about your physics?").frame(maxWidth: .infinity)){
                        
                        
                        TextFild_1(smalltext: "years", data: $user.userOld, text: "I`m ... old:", range: (1..<100))
                        TextFild_1(smalltext: "cm", data: $user.userHeight, text: "My height is:", range: (130..<230))
                        VStack{
                            Text("My weight is \(String(format: "%.1f", user.userWeight)) kg: ")
                            
                            
                            Slider(value: $user.userWeight, in: 20.0...180.0, step: 0.1)
                            Stepper("-/+ 0.1 kg", value: $user.userWeight, step: 0.1).padding(.horizontal, 50)
                        }
                    }
                    
                    Section(header: Text("Confirmed")){
                        Text("You are \(user.name) \(user.lastName) with height \(user.userHeight)cm and weight \(String(format: "%.1f", user.userWeight))kg. Your old is \(user.userOld) years?")
                    }
                    
                    
                    Button {
                        print("kjml")
                        
                        if user.name.count < 2 && user.lastName.count < 2{
                            textalert = "Too short name and lastname"
                            isAlert.toggle()
                        }else if user.lastName.count < 2{
                            textalert = "Too short lastname"
                            isAlert.toggle()
                        }else if user.name.count < 2{
                                textalert = "Too short name"
                                isAlert.toggle()
                        }else{
                            confirmDialog.toggle()
                        }
                        
                        
                    } label: {
                        
                        Text("Confirm").frame(maxWidth: .infinity)
                        
                            .cornerRadius(12)
                        
                    }
                }.cornerRadius(12)
                    .padding()
                    .padding(.top, 20)
                    .shadow(color: .black, radius: 10)
                    .accentColor(.indigo)
                
            
            }
            
            
        }.navigationBarBackButtonHidden(true)
            .confirmationDialog("Do you want finish?", isPresented: $confirmDialog, titleVisibility: .visible) {
                Button(role: .cancel) {
                    confirmDialog.toggle()
                } label: {
                    Text("No")
                }
                
                Button(role: .destructive) {
                    dismiss()
                } label: {
                    Text("Yeah")
                }
            }.alert(textalert, isPresented: $isAlert){
                Text("Ok")
            }
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView().environmentObject(User())
    }
}


