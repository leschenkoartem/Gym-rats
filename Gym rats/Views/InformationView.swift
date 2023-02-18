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
                
                Form{
                    
                    Section(header: Text("How can you be contacted?").frame(maxWidth: .infinity)){
                        TextField("Name ...", text: $user.name)
                            .textInputAutocapitalization(.words)
                            .autocorrectionDisabled(true)
                            .keyboardType(.alphabet)
                        
                        TextField("Lastname ...", text: $user.lastName)
                            .textInputAutocapitalization(.words)
                            .autocorrectionDisabled(true)
                            .keyboardType(.alphabet)
                        
                        Picker("", selection: $user.maleInt) {
                            Text("Man").tag(1)
                            Text("Women").tag(2)
                        }.pickerStyle(SegmentedPickerStyle())
                            .padding(.vertical, 3)
                        
                        
                    }
                    
                    Section(header: Text("what about your physics?").frame(maxWidth: .infinity)){
                        
                        Picker_1(smalltext: "years", data: $user.age, text: "I`m ... old:", range: (6..<100))
                        
                        Picker_1(smalltext: "cm", data: $user.height, text: "My height is:", range: (130..<230))
                        
                        VStack{
                            Text("My weight is \(String(format: "%.1f", user.weight)) kg: ")
                            
                            Slider(value: $user.weight, in: 20.0...180.0, step: 0.1)
                            
                            Stepper("-/+ 0.1 kg", value: $user.weight, step: 0.1).padding(.horizontal, 50)
                        }
                    }
                    
                    Section(header: Text("Confirmed")){
                        Text("You are \(user.name) \(user.lastName) with height \(user.height)cm and weight \(String(format: "%.1f", user.weight))kg. Your old is \(user.age) years?")
                    }
                    
                    
                    Button {
                        print("kjml")
                        
                        if user.age<6{
                            textalert = "Your age is incorect"
                            isAlert.toggle()
                        }else if user.lastName.count < 2{
                            textalert = "Too short lastname"
                            isAlert.toggle()
                        }else if user.name.count < 2{
                            textalert = "Too short name"
                            isAlert.toggle()
                        }else if user.weight < 20.0{
                            textalert = "None weight"
                            isAlert.toggle()
                        }else if user.height < 130{
                            textalert = "Your height is incorect"
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
                    user.setDeafult()
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
