//
//  ContentView.swift
//  DataFlow
//
//  Created by Vasichko Anna on 24.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Text("Hi, \(userSettings.name)!")
                .font(.largeTitle)
                .padding(.top, 50)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            ButtonView(action: timer.startTimer, title: timer.buttonTitle, color: .red)
            Spacer()
            ButtonView(action: logoutUser, title: "Log Out", color: .blue)
        }
        .padding()
    }
    
    private func logoutUser() {
        userSettings.isRegistered.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettings())
    }
}
