//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Егор on 12.11.2021.
//

import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    // Прииватное свойство по ключу "user", чтобы сохранять данные.
    @AppStorage("user") private var userData: Data?
    
    private init() {}
    
    // Создаем функцию save - кодиируем экземпляр модели User и передаем в с-во userData
    func save(_ user: User){
        userData = try? JSONEncoder().encode(user)
    }
    // Функциия которая возвращает уже неопциональные данные из userDefaults и декодируе данные в экземпляр модели User тк данные хранятся с типом Data.
    func loadUser() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else { return User()}
        return user
    }
    // Почему не стираем данные только в userData? Потому что нужно и стереть саму модельку, только после этого можно удалить данные из userData. 
    func clear(userManager: UserManager) {
        userManager.user.isRegistered = false
        userManager.user.name = ""
        userData = nil
    }
    
}
