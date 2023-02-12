//
//  TextFild.swift
//  Gym rats
//
//  Created by Artem Leschenko on 11.02.2023.
//

import SwiftUI

struct TextFild_1: View {
    @EnvironmentObject var user:User
    var smalltext:String
    var data:Binding<Int>
    var text:String
    var range: Range<Int>
    var body: some View {
        HStack{
            Text(text)
            Spacer()
            Picker("", selection: data) {
                ForEach(range) {
                    Text("\($0) \(smalltext)").tag($0)
                }
            }.frame(maxWidth: 150, maxHeight: 60)
                .pickerStyle(.wheel)
            
            
        }.padding(-10)
    }
}


