//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Егор on 02.11.2021.
//

import SwiftUI

struct LoginView: View {
    // @EnvironmentObject - создает источник данных доступный из любого представления всего проекта. То есть мы сами обращаемся к данным из того места где они нам нужны.
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            userNameTF(
                name: $userManager.user.name,
                nameIsValid: userManager.nameIsValid
            )
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.nameIsValid)
        }
        .padding()
    }
}


extension LoginView {
    
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered.toggle()
            DataManager.shared.save(userManager.user)
        }
    }
}

struct userNameTF: View {
    @Binding var name: String
    var nameIsValid = false
    
    var body: some View {
        ZStack {
            TextField("Type your name...", text: $name)
                .multilineTextAlignment(.center)
            HStack {
                Spacer()
                Text("\(name.count)")
                    .font(.callout)
                    .foregroundColor(nameIsValid ? .green : .red)
                    .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserManager())
    }
}
