//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Егор on 02.11.2021.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    private let user = DataManager.shared.loadUser()
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(UserManager(user: user))
        }
    }
}
