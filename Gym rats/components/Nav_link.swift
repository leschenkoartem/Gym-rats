//
//  button_1.swift
//  Gym rats
//
//  Created by Artem Leschenko on 11.02.2023.
//

import SwiftUI

struct Nav_link: View {
    var view = InformationView()
    var text = ""
    var body: some View {
        NavigationLink{view
        } label: {
                Text(text)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background()
                    .cornerRadius(12)
                    .foregroundColor(.indigo)
                    .padding(.horizontal, 50)
                    .shadow(color: .black, radius: 8, y: 5)
            
        }
    }
}

struct button_1_Previews: PreviewProvider {
    static var previews: some View {
        Nav_link()
    }
}
