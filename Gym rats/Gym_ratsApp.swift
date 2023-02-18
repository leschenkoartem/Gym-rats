//
//  Gym_ratsApp.swift
//  Gym rats
//
//  Created by Artem Leschenko on 10.02.2023.
//

import SwiftUI

@main
struct Gym_ratsApp: App {
    
    @StateObject var user = User()
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(user)
        }
    }
}


extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...0.5),
            green: .random(in: 0...0.5),
            blue: .random(in: 0...0.5)
        )
    }
}
