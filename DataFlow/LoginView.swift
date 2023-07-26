//
//  LoginView.swift
//  DataFlow
//
//  Created by Vasichko Anna on 24.07.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        VStack {
            ZStack {
                TextField("Enter your name...", text: $name)
                    .cornerRadius(20)
                    .multilineTextAlignment(.center)
                    .frame(height: 60)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.accentColor, lineWidth: 2)
                    }
                
                HStack {
                    Spacer()
                    Text("\(name.count)")
                        .foregroundColor(name.count > 3 ? .green : .red)
                        .padding(.trailing)
                }
            }
            .padding()
            
            Button(action: registerUser) {
                Label("OK", systemImage: "checkmark.circle")
            }
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            userSettings.name = name
            userSettings.isRegistered.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserSettings())
    }
}
