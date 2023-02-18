//
//  wed.swift
//  Gym rats
//
//  Created by Artem Leschenko on 18.02.2023.
//

import SwiftUI
struct ContentView: View {
    @State private var isPressed = false
    var body: some View {
        Button(action: {
            // action here
        }) {
            Text("Button")
        }
        .padding()
        .background(isPressed ? Color.blue : Color.yellow)
        .foregroundColor(.white)
        .font(.title)
        .cornerRadius(40)
        .scaleEffect(isPressed ? 0.8 : 1.0)
        .animation(.spring())
        .onTapGesture {
            self.isPressed.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

