//
//  listAccountView.swift
//  Gym rats
//
//  Created by Artem Leschenko on 13.02.2023.
//

import SwiftUI

struct listAccountView: View {
    var info:String
    var value:String
    var body: some View {
        HStack{
            Text(info)
            Spacer()
            Text(value)
        }.padding(.horizontal, 50)
            .font(.custom("", size: 20))
            .padding(.vertical,2)
            .foregroundColor(.white)
    }
}

struct listAccountView_Previews: PreviewProvider {
    static var previews: some View {
        listAccountView(info: "Weight", value: "78")
    }
}
